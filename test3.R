get_nouns<-function(tagged_text)
{
    ### Function to get only nouns ("NN") from a tagged text
  
    ### S4 object of type kRp.tagged has a data frame named 'TT.res' containing the result of tagging
    all_tags<-slot(tagged_text,"TT.res")
    
    ### Extract nouns by the its representative tag - 'NN'
    nouns<- (all_tags$token[all_tags$tag %in% c("NN")])
    
    ### Return the same list of nouns
    return(nouns)
}