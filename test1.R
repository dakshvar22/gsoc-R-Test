scraper_gutenberg <-function(url="http://www.gutenberg.org/cache/epub/100/pg100.txt")
{
  #### Text file to store the scrapped output
  TEXTFILE = "pg100.txt"
  if (!file.exists(TEXTFILE)) {
       download.file("http://www.gutenberg.org/cache/epub/100/pg100.txt", destfile = TEXTFILE)
   }
  text = readLines(TEXTFILE)
  
  ### Removing the end licences
  a<- grep("*** END OF THIS PROJECT GUTENBERG EBOOK ",text,fixed=TRUE)
  text=text[-(a:length(text))]
  
  # length(text)
  text = text[-(1:173)]
  text = text[-(124195:length(text))]
  text = paste(text, collapse = " ")
  
  ### Removing the disclaimers in the middle, thus giving a list of all works in the ebook.
  ### 218 in this case
  documents = strsplit(text, "<<[^>]*>>")[[1]]
  return(documents)
}