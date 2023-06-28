# “Back in my day …”

20 years of Ruby in 5 minutes

Paul Battley

Brighton Ruby Conference 2023

# About this repository

This describes the modification of a program while travelling back in time
from Ruby 3.2.2 (2023) to Ruby 1.6.8 (released at the end of 2022).

Each successfully modified version is tagged.

- v3_2_2
- v3_1_2
- v3_0_1
- v2_7_1
- v2_1_0
- v1_9_3
- v1_8_7
- v1_6_8

# Running older versions

I use [asdf](https://asdf-vm.com/) and its Ruby plugin, which uses
[ruby-build](https://github.com/rbenv/ruby-build) to build each version.

The two oldest versions required special attention:

- 1.8.7 would not build on my current machine (Ubuntu 22.04 x86_64), but worked
  in a container running Ubuntu 18.04.
- 1.6.8 will not compile under 64-bit Linux. I was able to compile it under
  a 32-bit container running Ubuntu 16.04, but `make install` did not work.
  It's still possible to run the `ruby` executable directly by giving it the
  path to the standard library.

The `Dockerfile`s for these versions are included in this repository, and can
be built with:

    docker build --tag ruby_1_8_7 docker/1_8_7
    docker build --tag ruby_1_6_8 docker/1_6_8

The provided script `run.sh` handles running the code inside the container.

# References

- [Significant new features since version
  2.0](https://rubyreferences.github.io/rubychanges/evolution.html)
- [List of major changes from 2.0 to
  2.7](https://www.rubyguides.com/ruby-version-changes/)
- [Changes in 1.8](https://viewsourcecode.org/why/hacking/rubyOneEightOh.html)
- [Changes in 1.9](https://stackoverflow.com/questions/21574/what-is-the-difference-between-ruby-1-8-and-ruby-1-9)
- [Current Ruby source](https://github.com/ruby/ruby)
- [Git mirror of the old Ruby Subversion repository](https://github.com/tmm1/matzruby).
  This includes older versions missing from the official repository.

# Changes addressed in this talk

- 3.2
    - `Data.define`
- 3.1
    - One-line pattern matching
    - Anonymous block argument (`def foo(&)`)
- 3.0
    - Pattern matching
    - One-line method definitions
- 2.6
    - Endless ranges
- 2.5
    - `keyword_init` in `Struct`
- 2.4
    - Boolean `match?` method on `Regexp` and `String`
- 2.3
    - Indented heredoc with `<<~`
- 2.0
    - `__dir__`
    - Default UTF-8 source encoding
    - `def` returns a symbol corresponding to the method name
- 1.9
    - Method chaining with leading `.`
    - Built-in JSON support
    - Rubygems in standard distribution
    - Unicode-aware core methods
- 1.8
    - Fully qualified names (`Foo::Bar`)
    - `File.read`
    - `Symbol#to_proc`
    - `Enumerable#sort_by`
