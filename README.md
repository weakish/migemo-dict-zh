This repository contains:

- a dictionary to use cmigemo with Chinese
- a Rakefile.rb to build the dictionary

## Usage

Put `migemo-dict-zh` to the place you want, then use it when calling cmigemo.

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

If you want to build the dictionary, you can just clone this repository, then run `rake` inside.

## Credit

Dictionary is converted from [hanzi_to_pinyin_node](https://github.com/wxianfeng/hanzi_to_pinyin_node).

## Todo

Support searching against phrases.
