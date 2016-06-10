library(readr); library(dplyr); library(ggplot2);library(RCurl);

#Use getURL to read the various years of data into text variables
crash_2014_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/a1d00c8a-18dd-43ee-aa13-c2998ceb76ad/download/2014alcocrash.csv")
crash_2013_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/eb54323c-164b-4010-a78f-2dba4d382604/download/2013alcocrash.csv")
crash_2012_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/bcd2e0a7-d059-4ec8-9d5d-3d293aadd4c4/download/2012alcocrash.csv")
crash_2011_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/0950f9ac-fe2f-4441-a355-d60ee7653f8c/download/2011alcocrash.csv")
crash_2010_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/93b3d18c-680f-4a1c-9896-72b446557505/download/2010alcocrash.csv")
crash_2009_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/4cccbf70-5709-4630-a0cd-cc4a3ed69be7/download/2009alcocrash.csv")
crash_2008_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/92608ca3-3a44-4fe8-af1a-967cfe8bc29d/download/2008alcocrash.csv")
crash_2007_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/1c7ce0ad-40d3-47e4-b654-6a6bdbfeca2c/download/2007alcocrash.csv")
crash_2006_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/01860f81-dd89-465a-ab73-1edc21858303/download/2006alcocrash.csv")
crash_2005_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/e6a24c09-c381-430b-b8ff-3ec5611538f5/download/2005alcocrash.csv")
crash_2004_text <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/17012686-77d8-477b-b034-5b4a4715ec53/download/2004alcocrash.csv")
link_dictionary <- getURL("https://data.wprdc.org/dataset/3130f583-9499-472b-bb5a-f63a6ff6059a/resource/12d9e6e1-3657-4cad-a430-119d34b1a5b2/download/crashdatadictionary.csv")

# bind all of the rows together
crashdata  <- bind_rows(read.csv(text = crash_2014_text), read.csv(text = crash_2013_text), read.csv(text = crash_2012_text), read.csv(text = crash_2011_text),
                        read.csv(text = crash_2010_text), read.csv(text = crash_2009_text), read.csv(text = crash_2008_text), read.csv(text = crash_2007_text),
                        read.csv(text = crash_2006_text), read.csv(text = crash_2005_text), read.csv(text = crash_2004_text)) %>% tbl_df()

#write.csv(crashdata, "~/all_crash_data.csv") #write csv file locally if needed (this is commented out)
link_dictionary <- read.csv(text = link_dictionary) %>% tbl_df()

rm(crash_2014_text,crash_2013_text,crash_2012_text,crash_2011_text,crash_2010_text,crash_2009_text,crash_2008_text,crash_2007_text,crash_2006_text,crash_2005_text,crash_2004_text)
