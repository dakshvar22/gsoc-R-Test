get_nouns<-function(tagged_text)
{
    all_tags<-slot(tagged_text,"TT.res")
    
    nouns<- (all_tags$token[all_tags$tag %in% c("NN")])
    return(nouns)
}