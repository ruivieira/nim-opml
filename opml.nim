import xmltree, xmlparser, streams, sequtils

type Feed* = object
  title: string
  url: string

proc parse*(file: string) : seq[Feed] =
  let content = newStringStream(readFile(file))
  let doc = content.parseXML
  let feeds = doc.findAll("outline")
  var collection : seq[Feed] = @[]
  for feed in feeds:
    if feed.attr("type") == "rss":
      let item = Feed(title: feed.attr("title"), url: feed.attr("xmlUrl"))
      collection.add(item)
  result = collection
