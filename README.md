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
