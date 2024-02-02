# Download data for sites: https://github.com/chuhousen/amerifluxr


install.packages("amerifluxr")
library("amerifluxr")


site <- amf_site_info()

site$SITE_ID[site$SITE_ID == "US-xHA"]
site$SITE_ID[site$SITE_ID == "US-xBA"]

amf_download_base(user_id = "smalone",
                           user_email = "smalone@fiu.edu",
                           site_id = "US-xHA",
                           data_product = "BASE-BADM",
                           data_policy = "LEGACY",
                           agree_policy = TRUE,
                           intended_use = "education",
                           intended_use_text = "Devlop an Ecology Lab",
                           verbose = TRUE,
                           out_dir = tempdir())

library("amerifluxr")
library(stringr)
library(dplyr)
rm(list=ls())

# Data is currently on the server:

#_______________________________________________________________________________________________________________________________
# Last Downloaded 05272022
site <- amf_site_info()
site$SITE_ID

amf_download_base(user_id = "sparkle",
                  user_email = "smalone@fiu.edu",
                  site_id = c("US-xHA", "US-xBA") ,
                  data_product = "BASE-BADM",
                  data_policy = "LEGACY",
                  agree_policy = TRUE,
                  intended_use = "model",
                  intended_use_text = "education",
                  verbose = TRUE,
                  out_dir = "/Users/sm3466/Dropbox (YSE)/Teaching/Workshops/AmeriFluxSites/Data")


