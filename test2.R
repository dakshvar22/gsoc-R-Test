treeTagger_invoke<-function(tagger_path,doc,lang)
{
  ### check if koRpus package is installed
  if("koRpus" %in% rownames(installed.packages())==FALSE){
    install.packages("koRpus")
  }
  
  ### load required libraries
  library(koRpus)
  library(base)
  
  ### compute the path for TreeTagger Library
  binary<- paste(c(tagger_path,'bin/tree-tagger'),collapse='')

  ### Check if the binary exists, Continue if so, else stop with an error.
  if(!file.exists(binary))
  {
    stop("Tree Tagger does not exist in the specified path!")
  }
  
  ### Invoke the treetagger function using the koRpus library
  taggedText <- treetag(doc, treetagger="manual", lang=lang,
                            TT.options=list(path=tagger_path, preset="en"))
  
  ### return the complete S4 object of type kRp.tagged
  return(taggedText)
}


