# swamp

<!-- badges: start -->
<!-- badges: end -->

The goal of swamp is to illustrate DRY (don't repeat yourself) and DAMP (descriptive and meaningful phrases) in tests of R packages.

For reference see https://r-pkgs.org/testing-design.html and https://r-pkgs.org/testing-advanced.html in R Packages by Hadley Wickham and Jenny Bryan.

## Stage 1: muddy!

Test files [test-works](https://github.com/maelle/swamp/blob/c67cc053cafb2cc5f5125cbc745b2f392a84e3df/tests/testthat/test-works.R) and [test-ok](https://github.com/maelle/swamp/blob/c67cc053cafb2cc5f5125cbc745b2f392a84e3df/tests/testthat/test-ok.R) both define an object called `test_object` at the top level. 
It is used in two tests in each file.

It is not an optimal pattern because you can't look at each test in isolation and quickly understand what is going on.
In a very long test file you would even have to scroll up and down, _gasp_!
Furthermore we define the same test object in two test files.

## Stage 2: DRY!

[diff](https://github.com/maelle/swamp/commit/381f244f56f1837207f2150a7e76c70bd59c0422)

At this stage we diligently remember about DRY, Don't Repeat Yourself, and about the mechanics of [testthat helper files](https://blog.r-hub.io/2020/11/18/testthat-utility-belt/).
Files whose name start with `helper-` are loaded before all tests.

So we create a helper file where we create `test_object`, which is therefore available for tests!
I forgot to add a GitHub Actions workflow in time so you have to believe me when I say tests passed, or to try this at home. :sweat_smile:

Now things aren't perfect yet. 
When we look at any of the test files, we can't really know what `test_object` is as its name is not "descriptive and meaninful".

Furthermore we now have `test_object` always defined for all test files which is probably useless. (a leak!)
It might not be problematic here but it could be.
It would be even worse for code with side effects.

## Stage 3: focus a bit more on DAMP

[diff](https://github.com/maelle/swamp/commit/9cc08937e1cabf112955004212e1d0bccf2ccda4)

At this stage we re-factor the code of the helper file into a _function_ with a more meaningful name (at least let's pretend it is!).
We call this function to define the object in all tests where it's needed.
So while the actual definition of the basic list is not in all tests, we have a better idea of what's going on when reading the test.

If the test were to fail, in the console we could run `devtools::load_all()` and run the code of the test, as `devtools::load_all()` loads testthat helper files.

## Conclusion

DRY vs DAMP is a trade-off.
To keep the water analogy, we don't want code whose effects leak unexpectedly.
We want self-contained test that we can understand and run without too much context.

One fact from the [book "Software Engineering at Google"](https://www.goodreads.com/book/show/48816586-software-engineering-at-google) that stuck with me is that code can afford to be a bit less obvious because it as tests covering it, whereas test code isn't covered by test code.

For elements such as environment variables and options, we would use calls such as `withr::local_envvar()` in each test, but let's keep this for another episode!
