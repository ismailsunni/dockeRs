library('altRnative')
library('ggplot2')
library('bookdown')
library('microbenchmark')

setwd('/home/ismailsunni/dev/r/sdsr')

x = microbenchmark('gnu r on ubuntu (native)' = {
    bookdown::clean_book(TRUE);
    unlink('_book/', recursive=TRUE); 
    unlink('_bookdown_files', recursive=TRUE);
    bookdown::render_book('index.Rmd', 'bookdown::gitbook');
    }, 
    times = 10
)
x
ggplot2::autoplot(x)