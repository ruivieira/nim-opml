# nim-opml

Module to parse (RSS) feeds from OPML files.

## Usage

```{nim}
let feeds = parse("feeds.opml")

```

`feeds` will be a `seq[Feed]`, where `Feed` contains a `title` and `url`.