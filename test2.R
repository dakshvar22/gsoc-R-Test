treeTagger_invoke<-function(tagger_path,doc,lang)
{
  if("koRpus" %in% rownames(installed.packages())==FALSE){
    install.packages("koRpus")
  }
  library(koRpus)
  library(base)
  binary<- paste(c(tagger_path,'bin/tree-tagger'),collapse='')
  print(binary)
  if(!file.exists(binary))
  {
    stop("Tree Tagger does not exist in the specified path!")
  }
  
  taggedText <- treetag(doc, treetagger="manual", lang=lang,
                            TT.options=list(path=tagger_path, preset="en"))
  
  return(taggedText)
}


