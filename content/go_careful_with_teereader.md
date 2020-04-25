---
title: "Careful with io.TeeReader and json.Decoder"
date: 2020-04-25T10:00:20+01:00
draft: false
tags: [software,go]
---
Some time ago, I was investigating very strange bug in our codebase:
```
PROXY: ERROR: http: ContentLength=513 with Body length 512
```

It was inside our Go reverse proxy, and what was very suspicious was the exact `1 byte` discrepancy.

My suspicion was on gzip middleware, which is often the cause when you forget to
set `request.ContentLength` after compressing the payload. However it turns out it was not the case.

Do you see anything problematic here?
```
buf := bytes.NewBuffer(make([]byte, 0)) 
reader := io.TeeReader(r.Body, buf)
query, err := json.NewDecoder(reader).Decode(&out)
if err != nil {
    // omited
}
r.Body.Close()
r.Body = ioutil.NopCloser(buf)
```

From the title of this post you can guess that indeed this is the problem. However it is not
so easy to reproduce. [Here is the same code](playground1), but the size of the body and data in reader
is identical. What is happening here?

[playground1]: https://play.golang.org/p/J_kIfx8FI8O

I realised that the json decoder may have some optimization that it does not read the entire request body and skips some bytes (like trailing newlines).

[Which is what I tried here](playground2), but it WORKS?! WHAT? So what is so special about the 512 bytes (from the error message)?

[playground2]: https://play.golang.org/p/MCHNQdHrTxK

[It turns out, that json decoder creates `512 bytes` buffers into which it copies input](https://golang.org/src/encoding/json/stream.go?#L157).

[It also looks ahead, to check if it should allocate another `512 bytes`](https://golang.org/src/encoding/json/stream.go#L114), [and if next byte is end of object or empty space, then stop reading input](https://golang.org/src/encoding/json/scanner.go?h=stateEndValue#L270).

So if I take the 1st playground example, and add a `/n` at the end of the JSON, [it reproduces the issue](playground3)!

[playground3]: https://play.golang.org/p/zccNC5YRKRU

So it seems like we can't use `json.Decoder` together with `io.TeeReader` to duplicate request body.

I was thinking of creating a bug report, but the documentation of TeeReader states this correctly:

> TeeReader returns a Reader that writes to w what it reads from r. All reads from r performed through it are matched with corresponding writes to w. There is no internal buffering - the write must complete before the read completes. Any error encountered while writing is reported as a read error. 

So if you don't read all bytes from `r`, not all bytes will be written to `w`. Simple.

To fix this, I switched to `ioutil.ReadAll` which reads all bytes, which is what we want.
