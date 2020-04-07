---
title: A hop, skip, and a jump
date: 2020-04-06
...

There's many benefits to working from the command line. A terminal-centric
workflow is broadly cross-platform, uses less system resources, is highly
customizable, and most importantly _fast_. But only if you take a little
time to get acquainted with the right tools. Take the example of moving up,
down, and around the filesystem hierarchy:

```
$ cd example/one/two/
$ pwd
/home/user/example/one/two/
$ cd three
$ pwd
/home/user/example/one/two/three
$ cd a/b/c
$ pwd
/home/user/example/one/two/three/a/b/c
$ cd
$ pwd
/home/user
$ z c
$ pwd
/home/user/example/one/two/three/a/b/c
$ z th
$ pwd
/home/user/example/one/two/three
```

Like tab-completion, autojump tools reduce command-line typing. Most work by remembering the most relevant and visited directories (sometimes through a ['frecency' algorithm](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/Places/Frecency_algorithm)) and then making educated guesses about where the user wants to go. This is obviously functionality designed around interactive shell work and not meant for scripting. There are a number of utilities built around this concept:

| command                                       | language | year first released |
|-----------------------------------------------|----------|---------------------|
| [autojump](https://github.com/wting/autojump) | Python   | 2009                |
| [fasd](https://github.com/whjvenyl/fasd)      | Shell    | 2011                |
| [z](https://github.com/rupa/z)                | Shell    | 2011                |
| [pazi](https://github.com/euank/pazi)         | Rust     | 2017                |

`pazi` got my attention because of it's impressive
[benchmarks](https://github.com/euank/pazi/blob/master/docs/Benchmarks.md). It
also has support for using
[fuzzy-finders](https://github.com/euank/pazi/blob/master/docs/usage/pipe.md),
which are themselves very useful tools. A simple alias of the default jump key
`z` to `j` makes the experience even more ergonomic. The hops don't always land
where expected, especially until the tool has had enough time to learn, but
skipping around saves time and needless typing overall.
