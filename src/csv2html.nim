import parsecsv
import argparse
import os
import system


include "row.nimf"
include "table.nimf"
include "html.nimf"

proc csv2html(csvfile: string, delimiter: string, quotechar: string, caption: string, title: string, header: bool, cssurl: string) = 
  var p: CsvParser
  var headerRow = ""
  p.open(csvfile)
  if header:
    p.readHeaderRow()
    headerRow = renderRow(p.headers, rowtype="th")
  var rows = newSeq[string](2)
  while p.readRow():
    rows.add(renderRow(p.row))
  p.close()
  echo renderHtml(renderTable(caption, headerRow, rows), title, cssurl)
  
  
  
when isMainModule:
  var p = newParser("CSV2HTML"):
    arg("csvfile")
    option("-d", "--delimiter", help="Field Delimiter. Default is ,.", default=",")
    option("-q", "--quotechar", help="Quote Character. Default is nothing")
    option("-t", "--title", help="Page Title. Will be printed in h1 tag")
    option("-c", "--caption", help="Table Caption")
    option("-s", "--css", help="Override CSS URL")
    flag("-f", "--header", help="Data has Header. Flow row will be `th`")
  if paramCount() < 1:
    echo p.help()
    quit(0)
  var args = p.parse()
  csv2html(args.csvfile, args.delimiter, args.quotechar, args.caption, args.title, args.header, args.css)
