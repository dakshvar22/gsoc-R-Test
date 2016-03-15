TEXTFILE = "pg100.txt"
if (!file.exists(TEXTFILE)) {
     download.file("http://www.gutenberg.org/cache/epub/100/pg100.txt", destfile = TEXTFILE)
 }
text = readLines(TEXTFILE)
# length(text)
text = text[-(1:173)]
text = text[-(124195:length(text))]
text = paste(text, collapse = " ")

documents = strsplit(text, "<<[^>]*>>")[[1]]
