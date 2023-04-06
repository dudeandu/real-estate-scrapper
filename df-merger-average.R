setwd("~/Desktop/scraped-data-average")

library(rJava)      # Needed for tabulizer
library(tabulizer)  # Handy tool for PDF Scraping
library(tidyverse)  # Core data manipulation and visualization libraries
library(readxl)
library(stringr)  

allfiles <- list.files("data-raw")

# topline_test <- read_tsv(file = paste('data-raw/', allfiles[1], sep = ''))
# secondline_test <- read_tsv(file = paste('data-raw/', allfiles[2], sep = ''))

# merged_test <- merge(topline_test,secondline_test, all = TRUE)

# for (i in 1:length(allfiles)){
#   temp_df <- read_tsv(file = paste('data-raw/', allfiles[i], sep = ''), show_col_types = FALSE)
#   headerNames <- c("date","year","month","area","numofsales","dollarVolume","allAveragePrice","allMedianPrice","newListings","SNLRTrend","activeListings","mosInvTrend","avgSPLP","avgLDOM","avgPDOM","detachedNumberofSales","detachedDollarVolume","detachedAveragePrice","detachedMedianPrice","detachedNewListings","detachedActiveListings","detachedAvgSPLP","detachedAvgLDOM","semidetachedNumberofSales","semidetachedDollarVolume","semidetachedAveragePrice","semidetachedMedianPrice","semidetachedNewListings","semidetachedActiveListings","semidetachedAvgSPLP","semidetachedAvgLDOM","attachedNumberofSales","attachedDollarVolume","attachedAveragePrice","attachedMedianPrice","attachedNewListings","attachedActiveListings","attachedAvgSPLP","attachedAvgLDOM","condotownhouseNumberofSales","condotownhouseDollarVolume","condotownhouseAveragePrice","condotownhouseMedianPrice","condotownhouseNewListings","condotownhouseActiveListings","condotownhouseAvgSPLP","condotownhouseAvgLDOM","condoapartmentNumberofSales","condoapartmentDollarVolume","condoapartmentAveragePrice","condoapartmentMedianPrice","condoapartmentNewListings","condoapartmentActiveListings","condoapartmentAvgSPLP","condoapartmentAvgLDOM","allcondoNumberofSales","allcondoDollarVolume","allcondoAveragePrice")
#   names(temp_df) <- headerNames
#   print(ncol(temp_df) == length(headerNames))
#   write_tsv(temp_df, paste('data-raw/', allfiles[i], sep = ''))
# }

merged_data <- read_tsv(file = paste('data-raw/', allfiles[1], sep = ''))

for (i in 2:length(allfiles)){
  print(i)
  temp_df <- read_tsv(file = paste('data-raw/', allfiles[i], sep = ''))
  print(nrow(temp_df))
  
  merged_data <- merge(merged_data,temp_df, all = TRUE)
}

write.csv(merged_data, "merged_TRREB_data_fulldataset.csv")

df_keep_columns <- merged_data[ c("date","year","month","area",
                                  "allAveragePrice", 
                                  "numofsales",
                                  "detachedAveragePrice",
                                  "detachedNumberofSales",
                                  "semidetachedAveragePrice",
                                  "semidetachedNumberofSales",
                                  "attachedAveragePrice",
                                  "attachedNumberofSales",
                                  "condotownhouseAveragePrice",
                                  "condotownhouseNumberofSales",
                                  "condoapartmentAveragePrice",
                                  "condoapartmentNumberofSales"
                                  ) ]

df_keep_columns_tenyr <- df_keep_columns[which(df_keep_columns$year >= max(df_keep_columns$year) - 11),]

write.csv(df_keep_columns_tenyr, "merged_TRREB_data.csv")

