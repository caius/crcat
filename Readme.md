# crcat

[cat(1)][] implemented in [Crystal][].

[cat(1)]: http://www.freebsd.org/cgi/man.cgi?cat(1)
[Crystal]: https://crystal-lang.org

## Usage

Build the binary to use:

```shell
make release
```

Reading stdin to stdout:

```bash
$ echo "hi" | bin/crcat
hi
```

Reading multiple files, including ones that don't exist:

```bash
$ echo -e "1\n2\n3\n4\n5" > count.txt
$ bin/crcat bling.txt count.txt
cat: bling.txt: No such file or directory
1
2
3
4
5
```

## License

```bash
$ bin/crcat LICENSE
```
