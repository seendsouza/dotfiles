#!/bin/sh

# diff is called by git with 7 parameters:
# path old-file old-hex old-mode new-file new-hex new-mode
# 1    2        3       4        5        6       7

"$HOME/.cargo/bin/diffsitter" "$2" "$5" | cat
