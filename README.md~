# gsoc-R-Test

## Test 1(test1.R)
scraper_gutenberg is a R function to scrape texts from the gutenberg project. It automatically removes the disclaimers and the license at the end of the text.

## Test 2(test2.R)
treeTagger_invoke is a R function to invoke the treeTagger module installed locally on the system with the help of 'koRpus' package and tag a sample text given in test_sentence.txt.

It takes as input - 
1) Path to treeTagger installation directory
2) Document containing text to be tagged
3) Language of the document

## Test 3(test3.R)
get_nouns is a R function to get nouns out of a tagged text input. This input should be an output of the earlier function - treeTagger_invoke.
It takes only one input which is the tagged text.

## Test 4(test4.R)
As the test was to code any function which would be anyhow related to the project, I thought of coding up a function which would simply return the Document Term Matrix of a set of documents which would be fetched directly from a directory as a training Corpus. The function completely takes care of the standard data cleaning tasks like punctuation removal, stopword removal, etc. Such a function would obviously be the first step in a project related to supervised text mining and topic modelling. The function takes as input

1) Path to directory containing documents used for training purposes

As output it simply returns the DocumentTermMatrix Object.

In addition to it, I also wrote a function which would also visualize the set of terms found in the training corpus in form of a word cloud. It takes as input the document term matrix got as output of the previous function and a mininmum threshold value on the frequency of each term.
