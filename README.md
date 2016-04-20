This repository contains:

- a dictionary to use cmigemo with Chinese
- a Rakefile.rb to build the dictionary

## Usage

The [develop][] branch of cmigemo has this directory built-in.
You can use it, e.g. via

```sh
cmigemo /usr/local/share/migemo/utf-8/migemo-dict-zh
```

[develop]: https://github.com/koron/cmigemo/tree/develop

For older versions of cmigemo,
put `migemo-dict-zh` to the place you want,
then use it with `cmigemo -d`:

```sh
cmigemo -d /path/to/migemo-dict-zh --other-cmigemo-options
```

You can also write a script `zhmigemo` and put it in your `$PATH`:

```sh
#!/bin/sh
cmigemo -d /path/to/migemo-dict-zh "$@"
```

If you use fish, you can just add a function:

```fish
function zhmigemo
    cmigemo -d /path/to/migemo-dict-zh $argv
end
funcsave zhmigemo
```

If you want to build the dictionary, you can just clone this repository, then run the following commands inside:

```sh
bundle install
rake
```

## Credit

Dictionary is converted from [hanzi_to_pinyin_node](https://github.com/wxianfeng/hanzi_to_pinyin_node).

## Todo

Support searching against phrases.
