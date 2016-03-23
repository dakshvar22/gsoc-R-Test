library(rvest)

scraper_gutenberg<-function(url,code)
{
  #### Text file to store the scrapped output
  options(HTTPUserAgent='Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36')
  TEXTFILE = paste("files/",code,".txt",sep="")
  file.create(TEXTFILE)
  if (!file.exists(TEXTFILE)) {
    download.file(url, destfile = TEXTFILE)
  }
  full_text <- readLines(TEXTFILE,warn=FALSE)

  ## Just after the disclaimer there is a Title tag where the document starts
  ## Document ends with this line - END OF THIS PROJECT GUTENBERG EBOOK
  print(head(full_text))
  start_index <- grep("Title:",full_text)
  
  ##using grep from Base for complete String or Pattern Matching
  end_index<- grep("END OF THIS PROJECT GUTENBERG EBOOK",full_text)
  
  
  full_text <- full_text[start_index:end_index]
  
  ##done cleaning
  
  fileConn<-file(TEXTFILE)
  writeLines(full_text, fileConn)
  close(fileConn)
}
getCode<-function(codeString)
{
  ### find last occurence of '/' in codeString
  g <- regexpr("\\/[^\\/]*$", codeString)
  codeString <- substring(codeString,g[[1]]+1)
  return(codeString)
}

scrapByAuthor <- function(searchAuthor)
{
  ### Function to scrap works of an author by his last name from Gutenberg Project
  startChar <- tolower(substring(searchAuthor,1,1))
  
  ### Construct url for filter by author page
  pageUrl <- paste("https://www.gutenberg.org/browse/authors/",startChar,sep="")
  page <- read_html(pageUrl)
  search = searchAuthor
  
  ### Get the div node of the page which contains all authors with their works
  authorNames <- html_nodes(page, "div.pgdbbyauthor h2 a")
  authors <- html_text(authorNames)
  
  ### Search the index of the required author
  row = pmatch(search,authors)
  row = (row+1)/2
  
  ### Use the same index to extract a list of all his works
  workLists <- html_nodes(page, "div.pgdbbyauthor ul")
  authorWorks <- html_nodes(workLists[row],"li.pgdbetext a")
  
  ### Get individual work codes 
  workCodes <- html_attr(authorWorks,"href")
  workCodes <- lapply(workCodes,getCode)
  
  ### For each workcode scrap the corresponding textfile from the project website
  for(code in workCodes)
  {
    ### Construct the url for the corresponding work text
    workURL = paste("http://www.gutenberg.org/cache/epub/",code,"/pg",code,".txt",sep="")
    print("Doing for url = ")
    print(workURL)
    scraper_gutenberg(workURL,code)
  }
}

