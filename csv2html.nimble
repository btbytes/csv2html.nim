# csv2html package
version = "0.1.0"
author = "Pradeep Gowda"
description = "render csv files as html files"
license = "BSD3"

# deps
requires "nim >= 1.0.0", "argparse >= 0.10.0"

srcDir = "src"
bin = @["csv2html"]

# tasks
task hello, "This is a hello task":
  echo("Hello World!")
