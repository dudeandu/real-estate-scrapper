setwd("~/Desktop/scraped-data-average")

install.packages("rJava",repos = "http://cran.us.r-project.org")      # Needed for tabulizer
install.packages("tabulizer",repos = "http://cran.us.r-project.org")  # Handy tool for PDF Scraping
devtools::install_github("ropensci/tabulizer",repos = "http://cran.us.r-project.org")
install.packages("tidyverse",repos = "http://cran.us.r-project.org")  # Core data manipulation and visualization libraries
install.packages("readxl",repos = "http://cran.us.r-project.org")
install.packages("stringr",repos = "http://cran.us.r-project.org")  # Install stringr package
