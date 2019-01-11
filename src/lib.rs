#![feature(test)]

extern crate test;

const LARGE_ENOUGH: usize = 10_000_000;

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

#[cfg(test)]
mod tests {
    use super::*;
    use test::Bencher;

    #[bench]
    fn bench_iter_default_step(b: &mut Bencher) {
        b.iter(|| iter_default_step(vec![1; LARGE_ENOUGH]));
    }

    #[bench]
    fn bench_iter_step_1(b: &mut Bencher) {
        b.iter(|| iter_step(vec![1; LARGE_ENOUGH], 1));
    }

    #[bench]
    fn bench_iter_step_16(b: &mut Bencher) {
        b.iter(|| iter_step(vec![1; LARGE_ENOUGH], 16));
    }

    #[bench]
    fn bench_iter_step_64(b: &mut Bencher) {
        b.iter(|| iter_step(vec![1; LARGE_ENOUGH], 64));
    }
}
