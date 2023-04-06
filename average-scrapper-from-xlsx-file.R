setwd("~/Desktop/scraped-data-average")

# install.packages("rJava")      # Needed for tabulizer
# install.packages("tabulizer")  # Handy tool for PDF Scraping
# devtools::install_github("ropensci/tabulizer")
# install.packages("tidyverse")  # Core data manipulation and visualization libraries
# install.packages("readxl")
# install.packages("stringr")                             # Install stringr package

library(rJava)      # Needed for tabulizer
library(tabulizer)  # Handy tool for PDF Scraping
library(tidyverse)  # Core data manipulation and visualization libraries
library(readxl)
library(stringr)  

runPdfcleaner <- function(this_raw) {
  
  this_raw <- gsub(',','',this_raw)
  this_raw <- gsub(' ','',this_raw)
  this_raw <- gsub('%','',this_raw)
  this_raw <- gsub('$','',this_raw, fixed=TRUE)
  this_raw <- str_squish(this_raw) 
  this_raw <- gsub(' ','\t',this_raw)
  
  this_raw <- gsub('TRREB\tTotal\t','',this_raw)
  this_raw <- gsub('Halton\tRegion\t','',this_raw)
  this_raw <- gsub('Burlington\t','',this_raw)
  this_raw <- gsub('Halton\tHills\t','',this_raw)
  this_raw <- gsub('Milton\t','',this_raw)
  this_raw <- gsub('Oakville\t','',this_raw)
  this_raw <- gsub('Peel\tRegion\t','',this_raw)
  this_raw <- gsub('Brampton\t','',this_raw)
  this_raw <- gsub('Caledon\t','',this_raw)
  this_raw <- gsub('Mississauga\t','',this_raw)
  this_raw <- gsub('City\tof\tToronto\t','',this_raw)
  this_raw <- gsub('York\tRegion\t','',this_raw)
  this_raw <- gsub('Aurora\t','',this_raw)
  this_raw <- gsub('Toronto\tWest\t','',this_raw)
  this_raw <- gsub('Toronto\tCentral\t','',this_raw)
  this_raw <- gsub('Toronto\tEast\t','',this_raw)
  this_raw <- gsub('E.\tGwillimbury\t','',this_raw)
  this_raw <- gsub('East\tGwillimbury\t','',this_raw)
  this_raw <- gsub('Georgina\t','',this_raw)
  this_raw <- gsub('King\t','',this_raw)
  this_raw <- gsub('Markham\t','',this_raw)
  this_raw <- gsub('Newmarket\t','',this_raw)
  this_raw <- gsub('Richmond\tHill\t','',this_raw)
  this_raw <- gsub('Vaughan\t','',this_raw)
  this_raw <- gsub('Whitchurch-Stouffville\t','',this_raw)
  this_raw <- gsub('Durham\tRegion\t','',this_raw)
  this_raw <- gsub('Ajax\t','',this_raw)
  this_raw <- gsub('Brock\t','',this_raw)
  this_raw <- gsub('Clarington\t','',this_raw)
  this_raw <- gsub('Oshawa\t','',this_raw)
  this_raw <- gsub('Pickering\t','',this_raw)
  this_raw <- gsub('Scugog\t','',this_raw)
  this_raw <- gsub('Uxbridge\t','',this_raw)
  this_raw <- gsub('Whitby\t','',this_raw)
  this_raw <- gsub('Dufferin\tCounty\t','',this_raw)
  this_raw <- gsub('Orangeville\t','',this_raw)
  this_raw <- gsub('Simcoe\tCounty\t','',this_raw)
  this_raw <- gsub('Adjala-Tosorontio\t','',this_raw)
  this_raw <- gsub('Bradford\tWest\tGwillimbury\t','',this_raw)
  this_raw <- gsub('Essa\t','',this_raw)
  this_raw <- gsub('Innisfil\t','',this_raw)
  this_raw <- gsub('New\tTecumseth\t','',this_raw)
  this_raw <- gsub('New Tecumseth','',this_raw)
  
  this_raw <- gsub('TREB\tTotal\t','',this_raw)
  this_raw <- gsub('City\tof\tToronto\tTotal\t','',this_raw)
  this_raw <- gsub('City\tof\tToronto\t','',this_raw)
  this_raw <- gsub('Total\t','',this_raw)
  this_raw <- gsub('Toronto\tW01\t','',this_raw)
  this_raw <- gsub('Toronto\tW02\t','',this_raw)
  this_raw <- gsub('Toronto\tW03\t','',this_raw)
  this_raw <- gsub('Toronto\tW04\t','',this_raw)
  this_raw <- gsub('Toronto\tW05\t','',this_raw)
  this_raw <- gsub('Toronto\tW06\t','',this_raw)
  this_raw <- gsub('Toronto\tW07\t','',this_raw)
  this_raw <- gsub('Toronto\tW08\t','',this_raw)
  this_raw <- gsub('Toronto\tW09\t','',this_raw)
  this_raw <- gsub('Toronto\tW10\t','',this_raw)
  this_raw <- gsub('Toronto\tC01\t','',this_raw)
  this_raw <- gsub('Toronto\tC02\t','',this_raw)
  this_raw <- gsub('Toronto\tC03\t','',this_raw)
  this_raw <- gsub('Toronto\tC04\t','',this_raw)
  this_raw <- gsub('Toronto\tC06\t','',this_raw)
  this_raw <- gsub('Toronto\tC07\t','',this_raw)
  this_raw <- gsub('Toronto\tC08\t','',this_raw)
  this_raw <- gsub('Toronto\tC09\t','',this_raw)
  this_raw <- gsub('Toronto\tC10\t','',this_raw)
  this_raw <- gsub('Toronto\tC11\t','',this_raw)
  this_raw <- gsub('Toronto\tC12\t','',this_raw)
  this_raw <- gsub('Toronto\tC13\t','',this_raw)
  this_raw <- gsub('Toronto\tC14\t','',this_raw)
  this_raw <- gsub('Toronto\tC15\t','',this_raw)
  this_raw <- gsub('Toronto\tE01\t','',this_raw)
  this_raw <- gsub('Toronto\tE02\t','',this_raw)
  this_raw <- gsub('Toronto\tE03\t','',this_raw)
  this_raw <- gsub('Toronto\tE04\t','',this_raw)
  this_raw <- gsub('Toronto\tE05\t','',this_raw)
  this_raw <- gsub('Toronto\tE06\t','',this_raw)
  this_raw <- gsub('Toronto\tE07\t','',this_raw)
  this_raw <- gsub('Toronto\tE08\t','',this_raw)
  this_raw <- gsub('Toronto\tE09\t','',this_raw)
  this_raw <- gsub('Toronto\tE10\t','',this_raw)
  this_raw <- gsub('Toronto\tE11\t','',this_raw)
  
  this_raw <- gsub('\t','\n',this_raw)
  
  this_raw_subed <- gsub(' ','\t',this_raw)
  
  return(this_raw_subed)
}

allfiles <- list.files("local-files")

headerNames <- c("area","numofsales","dollarVolume","allAveragePrice","allMedianPrice","newListings","SNLRTrend","activeListings","mosInvTrend","avgSPLP","avgLDOM","avgPDOM","detachedNumberofSales","detachedDollarVolume","detachedAveragePrice","detachedMedianPrice","detachedNewListings","detachedActiveListings","detachedAvgSPLP","detachedAvgLDOM","semidetachedNumberofSales","semidetachedDollarVolume","semidetachedAveragePrice","semidetachedMedianPrice","semidetachedNewListings","semidetachedActiveListings","semidetachedAvgSPLP","semidetachedAvgLDOM","attachedNumberofSales","attachedDollarVolume","attachedAveragePrice","attachedMedianPrice","attachedNewListings","attachedActiveListings","attachedAvgSPLP","attachedAvgLDOM","condotownhouseNumberofSales","condotownhouseDollarVolume","condotownhouseAveragePrice","condotownhouseMedianPrice","condotownhouseNewListings","condotownhouseActiveListings","condotownhouseAvgSPLP","condotownhouseAvgLDOM","condoapartmentNumberofSales","condoapartmentDollarVolume","condoapartmentAveragePrice","condoapartmentMedianPrice","condoapartmentNewListings","condoapartmentActiveListings","condoapartmentAvgSPLP","condoapartmentAvgLDOM")
allRegionRows <-c("TRREB Total","Halton Region","Burlington","Halton Hills","Milton","Oakville","Peel Region","Brampton","Caledon","Mississauga","City of Toronto","Toronto West","Toronto Central","Toronto East","York Region","Aurora","East Gwillimbury","Georgina","King","Markham","Newmarket","Richmond Hill","Vaughan","Whitchurch-Stouffville","Durham Region","Ajax","Brock","Clarington","Oshawa","Pickering","Scugog","Uxbridge","Whitby","Dufferin County","Orangeville","Simcoe County","Adjala-Tosorontio","Bradford West Gwillimbury","Essa","Innisfil","New Tecumseth") 
torontoRegionsRows <- c("TRREB Total","City of Toronto Total","Toronto West","Toronto W01","Toronto W02","Toronto W03","Toronto W04","Toronto W05","Toronto W06","Toronto W07","Toronto W08","Toronto W09","Toronto W10","Toronto Central","Toronto C01","Toronto C02","Toronto C03","Toronto C04","Toronto C06","Toronto C07","Toronto C08","Toronto C09","Toronto C10","Toronto C11","Toronto C12","Toronto C13","Toronto C14","Toronto C15","Toronto East","Toronto E01","Toronto E02","Toronto E03","Toronto E04","Toronto E05","Toronto E06","Toronto E07","Toronto E08","Toronto E09","Toronto E10","Toronto E11")

finished_DF <- data.frame()

runLocalExcelScraper <- function(file) {
  
  # date <- gsub('.xlsx','',"mw2303.xlsx")
  date <- gsub('.xlsx','',file)
  date <- gsub('mw','',date)
  date_month <- substr(date, 3, 4)
  date_year <- substr(date, 1, 2)
  full_date <- paste(date_month,'-20',date_year,sep = '')
  
  readthisfilename <- paste("local-files/mw",date_year, date_month,'.xlsx',sep = '')
  
  pdf_RAW <- read_xlsx(readthisfilename, sheet = 3, skip = 1)
  # pdf_RAW <- read_xlsx(readthisfilename, sheet = 24, skip = 0) 
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 7, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 32, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW[2:ncol(pdf_RAW)], pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 9, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 36, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 11, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 40, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 13, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 44, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 15, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 48, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_DF <- pdf_RAW
  
  pdf_DF <- cbind(allRegionRows,pdf_DF)
  
  names(pdf_DF) <- headerNames
  month <- rep(date_month,nrow(pdf_DF))
  year <- rep(date_year,nrow(pdf_DF))
  date <- rep(full_date,nrow(pdf_DF))
  pdf_DF <- cbind(month,pdf_DF)
  pdf_DF <- cbind(year,pdf_DF)
  pdf_DF <- cbind(date,pdf_DF)
  
  ##
  for ( i in 1:nrow(pdf_DF) ) {
    
    if (pdf_DF$condoapartmentNumberofSales[i] == "-" 
        || pdf_DF$condoapartmentNumberofSales[i] == 0 
        || pdf_DF$condotownhouseNumberofSales[i] == "-" 
        || pdf_DF$condotownhouseNumberofSales[i] == 0 
        || pdf_DF$condoapartmentDollarVolume[i] == "-" 
        || pdf_DF$condoapartmentDollarVolume[i] == 0 
        || pdf_DF$condotownhouseDollarVolume[i] == "-"
        || pdf_DF$condotownhouseDollarVolume[i] == 0) {
      pdf_DF$allcondoNumberofSales[i]  <- "-"
      pdf_DF$allcondoDollarVolume[i]  <- "-"
      pdf_DF$allcondoAveragePrice[i] <- "-"
    } else {
      
      print(as.numeric(pdf_DF$allcondoDollarVolume[i]))
      print(as.numeric(pdf_DF$allcondoNumberofSales[i]))
      print(i)
      
      pdf_DF$allcondoNumberofSales[i]  <- as.numeric(pdf_DF$condoapartmentNumberofSales[i]) + as.numeric(pdf_DF$condotownhouseNumberofSales[i])
      pdf_DF$allcondoDollarVolume[i]  <- as.numeric(pdf_DF$condoapartmentDollarVolume[i]) + as.numeric(pdf_DF$condotownhouseDollarVolume[i])
      pdf_DF$allcondoAveragePrice[i]  <- as.numeric(pdf_DF$allcondoDollarVolume[i]) / as.numeric(pdf_DF$allcondoNumberofSales[i])
    }
  }
  
  finished_DF <-pdf_DF
  
  #################################################################################################
  #################################################################################################
  #################################################################################################
  #################################################################################################
  #############################################################################################
  
  pdf_RAW <- read_xlsx(readthisfilename, sheet = 4, skip = 1)
  # pdf_RAW <- read_xlsx(readthisfilename, sheet = 26, skip = 0) 
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 8, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 34, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW[2:ncol(pdf_RAW)], pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 10, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 38, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 12, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 42, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 14, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 46, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 16, skip = 1)
  # pdf_RAW_page <- read_xlsx(readthisfilename, sheet = 50, skip = 0) 
  pdf_RAW <- cbind(pdf_RAW, pdf_RAW_page[2:ncol(pdf_RAW_page)])
  
  pdf_DF <- pdf_RAW
  
  pdf_DF <- cbind(torontoRegionsRows,pdf_DF)
  
  # pdf_DF <- read_tsv(this_raw_subed, col_names = FALSE)
  names(pdf_DF) <- headerNames
  month <- rep(date_month,nrow(pdf_DF))
  year <- rep(date_year,nrow(pdf_DF))
  date <- rep(full_date,nrow(pdf_DF))
  pdf_DF <- cbind(month,pdf_DF)
  pdf_DF <- cbind(year,pdf_DF)
  pdf_DF <- cbind(date,pdf_DF)
  
  ##
  allcondoNumberofSales <- rep(0,nrow(pdf_DF))
  allcondoDollarVolume <- rep(0,nrow(pdf_DF))
  allcondoAveragePrice <- rep(0,nrow(pdf_DF))
  pdf_DF <- cbind(pdf_DF,allcondoNumberofSales)
  pdf_DF <- cbind(pdf_DF,allcondoDollarVolume)
  pdf_DF <- cbind(pdf_DF,allcondoAveragePrice)
  
  for ( i in 1:nrow(pdf_DF) ) {
    
    if (pdf_DF$condoapartmentNumberofSales[i] == "-" 
        || pdf_DF$condoapartmentNumberofSales[i] == "0" 
        || pdf_DF$condotownhouseNumberofSales[i] == "-" 
        || pdf_DF$condotownhouseNumberofSales[i] == "0" 
        || pdf_DF$condoapartmentDollarVolume[i] == "-" 
        || pdf_DF$condoapartmentDollarVolume[i] == "0" 
        || pdf_DF$condotownhouseDollarVolume[i] == "-"
        || pdf_DF$condotownhouseDollarVolume[i] == "0") {
      pdf_DF$allcondoNumberofSales[i]  <- "-"
      pdf_DF$allcondoDollarVolume[i]  <- "-"
      pdf_DF$allcondoAveragePrice[i] <- "-"
    } else {
      pdf_DF$allcondoNumberofSales[i]  <- as.numeric(pdf_DF$condoapartmentNumberofSales[i]) + as.numeric(pdf_DF$condotownhouseNumberofSales[i])
      pdf_DF$allcondoDollarVolume[i]  <- as.numeric(pdf_DF$condoapartmentDollarVolume[i]) + as.numeric(pdf_DF$condotownhouseDollarVolume[i])
      pdf_DF$allcondoAveragePrice[i]  <- as.numeric(pdf_DF$allcondoDollarVolume[i]) / as.numeric(pdf_DF$allcondoNumberofSales[i])
    }
  }
  
  finished_DF <- merge(finished_DF,pdf_DF, all = TRUE)
  
  write_tsv(finished_DF, paste('data-raw/',date_month,date_year,'_all.tsv', sep = ""))
  
  # print(paste(allfiles[i]),' extracted and saved as = data-raw/',date_month,date_year,'_all.tsv',sep = '')

}


for (i in 1:length(allfiles)) {
  # print(paste('Extracting ',allfiles[i]),sep = '')
  runLocalExcelScraper(allfiles[i])
}








