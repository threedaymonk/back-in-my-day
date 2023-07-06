# “Back in my day …”

20 years of Ruby in 5 minutes

Paul Battley

Brighton Ruby Conference 2023

# About this repository

This accompanies a lightning talk I gave at [Brighton Ruby Conference
2023][brighton-ruby]. A [transcript of the talk][transcript] can be found
on my website.

This describes the modification of a program while travelling back in time
from Ruby 3.2.2 (2023) to Ruby 1.6.8 (released at the end of 2002).

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

I use [asdf][asdf] and its Ruby plugin, which uses
[ruby-build][ruby-build] to build each version.

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

See also the [all-ruby][all-ruby] project for another way to do this, that
works all the way back to Ruby 0.49.

# References

- [Brighton Ruby Conference][brighton-ruby]
- [Transcript of this talk][transcript]
- [asdf][asdf] is a multiple runtime version manager, like rbenv or rvm but
  supporting many more runtimes
- [ruby-build][ruby-build] "simplifies installation of any Ruby version from
  source on Unix-like systems." Not quite any version, but it works as far back
  as 1.8
- [Significant new features since version 2.0][evolution]
- [List of major changes from 2.0 to 2.7][version-changes]
- [Changes in 1.8][one-eight-oh]
- [Changes in 1.9][differences-1-8-and-1-9]
- [Current Ruby source][git-source]
- [Git mirror of the old Ruby Subversion repository][git-svn-mirror].
  This includes older versions missing from the official repository
- [ruby-lang FTP server][ruby-ftp].
  This includes releases not listed on the website, all the way back to 1.0.
  Thanks to [Leah Neukirchen][leah-neukirchen]
- [all-ruby][all-ruby], a project that builds and runs Ruby versions back to
  0.49. Thanks to [Matias Korhonen][matias-korhonen], who appears to have given a
  similar talk at RubyConfBY in 2020

[brighton-ruby]: https://brightonruby.com/
[transcript]: https://po-ru.com/talks/bimd
[asdf]: https://asdf-vm.com/
[ruby-build]: https://github.com/rbenv/ruby-build
[evolution]: https://rubyreferences.github.io/rubychanges/evolution.html
[version-changes]: https://www.rubyguides.com/ruby-version-changes/
[one-eight-oh]: https://viewsourcecode.org/why/hacking/rubyOneEightOh.html
[differences-1-8-and-1-9]: https://stackoverflow.com/questions/21574/what-is-the-difference-between-ruby-1-8-and-ruby-1-9
[git-source]: https://github.com/ruby/ruby
[git-svn-mirror]: https://github.com/tmm1/matzruby
[ruby-ftp]: https://ftp.ruby-lang.org/pub/ruby/
[leah-neukirchen]: https://leahneukirchen.org/
[all-ruby]: https://github.com/akr/all-ruby
[matias-korhonen]: https://matiaskorhonen.fi/

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
