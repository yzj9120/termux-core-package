---
page_ref: "@ARK_PROJECT__VARIANT@/termux/termux-core-package/docs/@ARK_DOC__VERSION@/developer/test/index.md"
---

# termux-core-package Test Docs

<!-- @ARK_DOCS__HEADER_PLACEHOLDER@ -->

[`termux-core-tests`](https://github.com/termux/termux-core-package/blob/master/app/main/tests/termux-core-tests.in) can be used to run tests for [`termux-core`](https://github.com/termux/termux-core-package) can be tested with and other external Termux packages.

To show help, run `"${TERMUX__PREFIX:-$PREFIX}/libexec/installed-tests/termux-core/app/main/termux-core-tests" --help`.

&nbsp;

To run all tests, run `"${TERMUX__PREFIX:-$PREFIX}/libexec/installed-tests/termux-core/app/main/termux-core-tests" -vv all`. You can optionally run only `unit` or `runtime` tests as well.
- The `unit` tests test different units/components of libraries and executables.
- The `runtime` tests test the runtime execution of libraries and executables.

&nbsp;

Two variants of each test binary is compiled.
- With `fsanitize` enabled with the `-fsanitize=address -fsanitize-recover=address -fno-omit-frame-pointer` flags that contain `-fsanitize` in filename
- Without `fsanitize` enabled that contain `-nofsanitize` in filename.

This is requires because `fsanitize` does not work on all Android versions/architectures properly and may crash with false positives with the `AddressSantizier: SEGV on unknown address` error, like Android `7` (always crashes) and `x86_64` (requires loop to trigger as occasional crash), even for a source file compiled with an empty `main()` function.

To enable `AddressSantizier` while running `termux-core-tests`, pass `-f`. To also enable `LeakSanitizer`, pass `-l` as well, but if it is not supported on current device, the `termux-core-tests` will error out with `AddressSantizier: detect_leaks is not supported on this platform`.

If you get `CANNOT LINK EXECUTABLE *: library "libclang_rt.asan-aarch64.so" not found`, like on Android `7`, you will need to install the `libcompiler-rt` package to get the `libclang_rt.asan-aarch64.so` dynamic library required for `AddressSantizier` if passing `-f`. Export library file path with `export LD_LIBRARY_PATH="${TERMUX__PREFIX:-$PREFIX}/lib/clang/17/lib/linux"` before running tests.

&nbsp;

By default, `termux-core-tests` also runs tests other external Termux packages/commands to ensure proper functioning of the Termux execution environment. To only run `termux-core` package specific tests, pass `--only-termux-core-tests`. To run tests for specific packages only, pass a regex with `--test-packages-filter=<filter>` option.

&nbsp;

Make sure to grant Termux app `Draw over apps` permission as otherwise `termux-am` tests will fail.

---

&nbsp;





## Help

```
termux-core-tests can be used to run tests for 'termux-core' and
other external Termux packages.


Usage:
    termux-core-tests [command_options] <command>

Available commands:
    unit                      Run unit tests.
    runtime                   Run runtime on-device tests.
    all                       Run all tests.

Available command_options:
    [ -h | --help ]           Display this help screen.
    [ --version ]             Display version.
    [ -q | --quiet ]          Set log level to 'OFF'.
    [ -v | -vv | -vvv | -vvvvv ]
                              Set log level to 'DEBUG', 'VERBOSE',
                              'VVERBOSE' and 'VVVERBOSE'.
    [ -f ]                    Use fsanitize binaries for AddressSanitizer.
    [ -l ]                    Detect memory leaks with LeakSanitizer.
                              Requires '-f' to be passed.
    [ --no-clean ]            Do not clean test files on failure.
    [ --only-termux-core-tests ]
                              Only run 'termux-core' package tests.
    [ --test-names-filter=<filter> ]
                              Regex to filter which tests to run by
                              test name.
    [ --test-packages-filter=<filter> ]
                              Regex to filter which tests to run by
                              package names. By default tests for
                              both 'termux-core' and external Termux
                              packages are run.
    [ --tests-path=<path> ]   The path to installed-tests directory.
```

---

&nbsp;
