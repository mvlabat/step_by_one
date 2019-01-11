This repository is created to demonstrate negative performance impact of calling `step_by` on a `Iterator`
(of a vector in this particular case). There're 4 benchmarks in this crate:
1. Just iterating the vector without `step_by` called
2. Iterating with `step_by(1)`: shows 1.75x slower speed than the first benchmark
3. Iterating with `step_by(16)`: shows 1.05x slower speed than the first benchmark
4. Iterating with `step_by(64)`: shows almost the same speed as the first benchmark

The lib provides two functions that are tested:

```rust
pub fn iter_default_step(mut arr: Vec<i32>) -> Vec<i32> {
    for e in arr.iter_mut() {
        *e = e.wrapping_add(3);
    }
    arr
}

pub fn iter_step(mut arr: Vec<i32>, iter_step: usize) -> Vec<i32> {
    for e in arr.iter_mut().step_by(iter_step) {
        *e = e.wrapping_add(3);
    }
    arr
}
```

I'm running Macbook Pro 2015 with Intel i5-5257U CPU (2.70GHz).

My rustc version: `1.33.0-nightly (c2d381d39 2019-01-10)`.

So here are the exact results of the benchmarks (just run `cargo bench` without arguments):
```
running 4 tests
test tests::bench_iter_default_step ... bench:   8,702,963 ns/iter (+/- 1,648,782)
test tests::bench_iter_step_1       ... bench:  15,267,083 ns/iter (+/- 1,236,220)
test tests::bench_iter_step_16      ... bench:   9,053,772 ns/iter (+/- 380,422)
test tests::bench_iter_step_64      ... bench:   8,711,169 ns/iter (+/- 327,562)
```

I think that step 16 is expected to be almost equal to step 1, because we read the exact same amount of RAM,
while iterating through values in CPU cache is quite cheap. And I would expect step 64 to be faster than both 1 and 16.

The results almost meet the expectations, except for the very strange case with calling `step_by(1)`.

Here is generated asm output of the functions I got with [cargo-asm](https://github.com/gnzlbg/cargo-asm):
[iter_default_step](./iter_default_step.s) and [iter_step](./iter_step.s).
