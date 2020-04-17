make:
	# Convert from markdown to html
	# nav.html
	pandoc -f markdown+emoji -t html -o nav.html nav.md
	# index.html
	pandoc -f markdown+emoji -t html -o index-content.html content/index.md
	# books.html
	pandoc -f markdown+emoji -t html -o books-content.html content/books.md
	# reading
	pandoc -f markdown+emoji -t html -o reading-content.html content/reading.md

	# Concatenate html files with header/sep/footer
	# index.html
	cat skeleton/header.html nav.html skeleton/sep.html \
		index-content.html skeleton/footer.html > index.html
	# books.html
	cat skeleton/header.html nav.html skeleton/sep.html \
		books-content.html skeleton/footer.html > books.html
	# reading.html
	cat skeleton/header.html nav.html skeleton/sep.html \
		reading-content.html skeleton/footer.html > reading.html

	# Remove html files
	rm nav.html books-content.html reading-content.html index-content.html

push:
	git commit -am "update"
	git push
