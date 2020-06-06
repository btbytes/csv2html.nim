csv2html: csv2html.nimble src/csv2html.nim
	nimble build

.PHONY: clean

clean:
	rm -f csv2html

