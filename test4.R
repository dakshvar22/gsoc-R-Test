getDTM <- function(trainPath)
{
  ### Function to get the Document Term Matrix using the tm package. The function takes care of 
  ### data cleaning steps such as punctuation removal and stopwords removal. 
  
  ### load required package - 'tm'
  library(tm)
  
  ### Build a corpus of documents using the directory path given as function argument. Corpus()
  ### function given by 'tm' package.
  trainCorpus <- Corpus(DirSource(trainPath))
  
  ### Start with some data cleaning
  
  #create the toSpace content transformer from 'tm' package.
  includeSpace <- content_transformer(function(x, pattern) {return (gsub(pattern, " " , x))})
  trainCorpus <- tm_map(trainCorpus,includeSpace,"-")
  trainCorpus <- tm_map(trainCorpus,includeSpace,":")
  
  #Replace Punctuation marks with " "
  trainCorpus <- tm_map(trainCorpus,removePunctuation)
  
  ### Note: Inspect the corpus to find some special kind of punctuators like ' -' or " ' " which
  ### need to be eliminated.
  
  #Transform to lower case.
  trainCorpus <- tm_map(trainCorpus,content_transformer(tolower))
  
  #Remove english stop-words
  trainCorpus <- tm_map(trainCorpus,removeWords,stopwords("english"))
  
  ### Stemming not handled as it has its own tradeoffs.
  
  ### FInal Step : Get Document-Term Matrix
  mat <- DocumentTermMatrix(trainCorpus)
  
  ### Return DocumentTermMatrix object created by tm package
  return(mat)
}

getMostFrequent <- function(dtMat,number)
{
  ### Function to get the most frequent occuring words in the training corpus
  
  # Get the frequency of each term
  freq <- colSums(as.matrix(dtMat))
  
  #create sort order (desc)
  frequent <- order(freq,decreasing=TRUE)
  
  frequent<- frequent[1:number]
  return(freq[frequent])

}


genWordCloud <- function(dtMat,minFreq)
{
  ### Function to generate a wordcloud of the terms found in the documents using the 'wordcloud' package.
  ### Get term frequencies by summing over columns of the matrix
  freq <- colSums(as.matrix(dtMat))
  
  ### load wordcloud package
  library(wordcloud)
  
  #setting the same seed each time ensures consistent look across clouds
  set.seed(42)
  #limit words by specifying min frequency
  wordcloud(names(freq),freq, min.freq=minFreq,colors=brewer.pal(6,"Dark2"))
}