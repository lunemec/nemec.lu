---
title: "As"
date: 2020-04-22T00:00:00+01:00
draft: false
tags: [software]
---
[`As`][github_link] is a library to convert numeric types with overflow check in Go.

## Why?
Other languages like *Rust* have overflow checks on type casts (if you use `TryFrom` and not just `as`), but for *Go* there is nothing like that.

My need came from a simple bug, where external integer type was being type casted multiple times across multiple API boundaries. Because the original integer size was hidden across several API hops, the affected code expected too small integer size, and overflowed.

While this library wouldn't fix the root cause (API hops changing the base type), it would at least catch the affected part and return error, which is good enough for me. You can fix it if you see error, if it just overflows, you wait until client reports it, or something unrelated fails spectacularly.

[Github link][github_link].
```go
package main

import (
    "fmt"

    "github.com/lunemec/as"
)

func main() {
	for _, n := range []int{127, 128} {
		num, err := as.Int8(n)
		if err != nil {
			fmt.Printf("Input invalid: %d, err: %s\n", num, err)
		} else {
			fmt.Printf("Input valid: %d\n", num)
		}
	}
	// Output: Input valid: 127
	// Input invalid: -128, err: 128 (int) overflows int8
}
```

To convert slice types:
```go
package main

import (
    "fmt"

    "github.com/lunemec/as"
)

func main() {
	out, err := as.SliceT[int, int8]([]int{127, 128})
	fmt.Printf("Output: %+v, error: %+v\n", out, err)
	// Output: Output: [127 0], error: 1 error occurred:
	// 	* at index [1]: 128 (int) overflows int8
}
```

[github_link]: https://github.com/lunemec/as
