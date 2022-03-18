###############################
#Clear Workspace Image
rm(list=ls())

#set working directory
setwd("C:/Users/cherr/Desktop/USC Research/ESS Datasets")

#load packages####
library(tidyverse)
library(dplyr)
library(tidyr)
library(foreign)
library(car)
library(ggpubr)
library(likert)
library(RColorBrewer)

###############################

#Load Data####
#Create Country list 
countries <- c("United Kingdom","France","Germany","Spain","Sweden")
#Load in ESS14 Data
ESS14 <- read.spss("ESS7e02_2 (2014).sav")
#create Main ESS2014 Dataframe (ESS14 Translated)
ESS2014 <- as.data.frame(ESS14)
##Data Preparation#####
#Creating Mother and Father Variable
ESS2014 <- ESS2014 %>%
  unite("FM", c('facntr','mocntr'))

#Record Instances where neither parent is definitively born out of the country
##facntr/mocntr asks "Was your Father/Mother born in [country]?"
ESS2014$FM <- gsub("Yes_Yes", 0, as.character(ESS2014$FM))


##COUNTRYCODES#####
#Create CountryCode variable to gsub
ESS2014$CountryCode <- ESS2014$cntbrthc
#NEW CODES (added since 2002)
ESS2014$CountryCode<-gsub("DDR","01",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("USSR","02",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Czechoslovakia","03",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Yugoslavia","04",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("East Timor","05",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Serbia and Montenegro","06",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Alien's passport","65",as.character(ESS2014$CountryCode))

#OLD CODES (from 2002)
ESS2014$CountryCode<-gsub("Refusal","77",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Don't know","88",as.character(ESS2014$CountryCode))	
ESS2014$CountryCode<-gsub("Andorra","AD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("United Arab Emirates","AE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Afghanistan","AF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Antigua and Barbuda","AG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Anguilla","AI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Albania","AL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Armenia","AM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Angola","AO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Antarctica","AQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Argentina","AR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("American Samoa","AS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Austria","AT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Australia","AU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Aruba","AW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Åland Islands","AX",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Azerbaijan","AZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bosnia and Herzegovina","BA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Barbados","BB",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bangladesh","BD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Belgium","BE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Burkina Faso","BF",as.character(ESS2014$CountryCode))	
ESS2014$CountryCode<-gsub("Bulgaria","BG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bahrain","BH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Burundi","BI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Benin","BJ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Barthélemy","BL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bermuda","BM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Brunei Darussalam","BN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bolivia","BO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bonaire, Sint Eustatius and Saba","BQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Brazil","BR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bahamas","BS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bhutan","BT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Bouvet Island","BV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Botswana","BW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Belarus","BY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Belize","BZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Canada","CA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cocos (Keeling) Islands","CC",as.character(ESS2014$CountryCode))	
ESS2014$CountryCode<-gsub("Congo, The Democratic Republic of the","CD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Central African Republic","CF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Congo","CG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Switzerland","CH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Côte d'Ivoire","CI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cook Islands","CK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Chile","CL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cameroon","CM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("China","CN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Colombia","CO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Costa Rica","CR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cuba","CU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cape Verde","CV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Curaçao","CW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Christmas Island","CX",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cyprus","CY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Czechia","CZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Germany","DE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Djibouti","DJ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Denmark","DK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Dominica","DM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Dominican Republic","DO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Algeria","DZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Ecuador","EC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Estonia","EE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Egypt","EG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Western Sahara","EH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Eritrea","ER",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Spain","ES",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Ethiopia","ET",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Finland","FI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Fiji","FJ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Falkland Islands (Malvinas)","FK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Micronesia, Federated States of","FM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Faroe Islands","FO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("France","FR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Gabon","GA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("United Kingdom","GB",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Grenada","GD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Georgia","GE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("French Guiana","GF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guernsey","GG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Ghana","GH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Gibraltar","GI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Greenland","GL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Gambia","GM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guinea","GN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guadeloupe","GP",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Equatorial Guinea","GQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Equatorial GN","GQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Greece","GR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("South Georgia and the South Sandwich Islands","GS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guatemala","GT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guam","GU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guinea-Bissau","GW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Guyana","GY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Hong Kong","HK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Heard Island and McDonald Islands","HM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Honduras","HN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Croatia","HR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Haiti","HT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Hungary","HU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Indonesia","ID",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Ireland","IE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Israel","IL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Isle of Man","IM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("India","IN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("British Indian Ocean Territory","IO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Iraq","IQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Iran, Islamic Republic of","IR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Iceland","IS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Italy","IT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Jersey","JE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Jamaica","JM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Jordan","JO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Japan","JP",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kenya","KE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kyrgyzstan","KG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cambodia","KH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kiribati","KI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Comoros","KM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Kitts and Nevis","KN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Korea, Democratic People's Republic of","KP",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Korea, Republic of","KR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kuwait","KW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Cayman Islands","KY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kazakhstan","KZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Lao People's Democratic Republic","LA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Lebanon","LB",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Lucia","LC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Liechtenstein","LI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sri Lanka","LK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Liberia","LR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Lesotho","LS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Lithuania","LT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Luxembourg","LU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Latvia","LV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Libya","LY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Morocco","MA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Monaco","MC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Moldova, Republic of","MD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Montenegro","ME",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Martin (French Part)","MF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Madagascar","MG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Marshall Islands","MH",as.character(ESS2014$CountryCode))	
ESS2014$CountryCode<-gsub("Macedonia, The Former Yugoslav Republic of","MK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mali","ML",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Myanmar","MM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mongolia","MN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Macao","MO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Northern Mariana Islands","MP",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Martinique","MQ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mauritania","MR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Montserrat","MS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Malta","MT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mauritius","MU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Maldives","MV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Malawi","MW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mexico","MX",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Malaysia","MY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mozambique","MZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Namibia","NA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("New Caledonia","NC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Niger","NE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Norfolk Island","NF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Nigeria","NG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Nicaragua","NI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Netherlands","NL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Norway","NO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Nepal","NP",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Nauru","NR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Niue","NU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("New Zealand","NZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Oman","OM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Panama","PA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Peru","PE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("French Polynesia","PF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Papua New Guinea","PG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Philippines","PH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Pakistan","PK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Poland","PL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Pierre and Miquelon","PM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Pitcairn","PN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Puerto Rico","PR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Palestine, State of","PS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Portugal","PT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Palau","PW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Paraguay","PY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Qatar","QA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Réunion","RE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Romania","RO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Serbia","RS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Russian Federation","RU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Rwanda","RW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saudi Arabia","SA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Solomon Islands","SB",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Seychelles","SC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sudan","SD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sweden","SE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Singapore","SG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Helena, Ascension and Tristan Da Cunha","SH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Slovenia","SI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Svalbard and Jan Mayen","SJ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Slovakia","SK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sierra Leone","SL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("San Marino","SM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Senegal","SN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Somalia","SO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Suriname","SR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("South Sudan","SS",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sao Tome and Principe","ST",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("El Salvador","SV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Sint Maarten (Dutch Part)","SX",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Syrian Arab Republic","SY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Swaziland","SZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Turks and Caicos Islands","TC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Chad","TD",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("French Southern Territories","TF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Togo","TG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Thailand","TH",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tajikistan","TJ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tokelau","TK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Turkmenistan","TM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tunisia","TN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tonga","TO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Turkey","TR",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Trinidad and Tobago","TT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tuvalu","TV",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Taiwan, Province of China","TW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Tanzania, United Republic of","TZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Ukraine","UA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Uganda","UG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("United States Minor Outlying Islands","UM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("United States","US",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Uruguay","UY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Uzbekistan","UZ",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Holy See (Vatican City State)","VA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Saint Vincent and the Grenadines","VC",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Venezuela, Bolivarian Republic of","VE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Virgin Islands, British","VG",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Virgin Islands, U.S.","VI",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Viet Nam","VN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Vanuatu","VU",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Wallis and Futuna","WF",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Samoa","WS",as.character(ESS2014$CountryCode))
#ESS2014$CountryCode<-gsub("Yemen","YE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Mayotte","YT",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("South Africa","ZA",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Zambia","ZM",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Zimbabwe","ZW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Not applicable","66",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("No answer","99",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("DMn Republic	","DO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("NEia	","NG",as.character(ESS2014$CountryCode))
#ESS2014$CountryCode<-gsub("YeYE","YE",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("PY	","PY",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("AN","AN",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("GN-Bissau","GW",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Kosovo","XK",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("BO, Plurinational State of","BO",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Timor-Leste","TL",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("British INn Ocean Territory","IO",as.character(ESS2014$CountryCode))



for (val in countries){
  #########Data Calculation##########
  #create 2014.a variable which selects only data that is from the specified country
  ESS2014.a <- subset(ESS2014, ESS2014$cntry == val)
  #Creating the "Immigrant" Dataframe"
  #subset dataframe based on immigrant status, using answers that are not definitively Yes
  #AKA "Born in Country" = "No", "Refusal", "Don't Know","No Answer"
  ESS2014.immigrant <- subset(ESS2014.a,ESS2014.a$brncntr == "No")
  #Create ImmigrantStatus variable to determine whether or not the immigrant is from somewhere else in the EU or not
  ESS2014.immigrant$ImmigrantStatus <- if_else(ESS2014.immigrant$CountryCode %in% c('XK','IM','AX','AD','AL','AT','BA','BE','BG','BY','CH','03','CZ','DE','DK','EE','ES','FI','FO','FR','GB','GE','GI','GR','HR','HU','IE','IS','IT','LI','LK','LT','LU','LV','MC','MD','MK','MT','NL','NO','PL','PT','RO','RU','RS','SE','SI','SJ','SK','SM','02','UA','VA','04','ME','06'),"European Immigrant","Non-European Immigrant")
  #Creating Non Immigrant Dataframe
  ESS2014.nonimmigrant <- subset(ESS2014.a,ESS2014.a$brncntr == "Yes" & ESS2014.a$FM == 0)
  #Native-Born status for Non-Immigrants
  ESS2014.nonimmigrant$ImmigrantStatus <- "Native-Born"
  #join the two datasets together
  ESS2014.final <- full_join(ESS2014.immigrant, ESS2014.nonimmigrant)
  
  #dataframe
  #subset all variables needed
  QFIM.df <- data.frame(matrix(ncol=6,nrow=9))
  IM.df <- data.frame(matrix(ncol=6,nrow=15))
  PPLSTRD.df <- data.frame(matrix(ncol=6,nrow=3))
  
  colnames(QFIM.df) <- c("1-3","4-6","7-9","Extremely Important","Extremely Unimportant","Category")
  colnames(IM.df) <- c("1-3","4-6","7-9","Extremely Positive","Extremely Negative","Category")
  colnames(PPLSTRD.df) <- c("Agree","Agree Strongly","Disagree","Disagree Strongly","Neither Agree nor Disagree","Category")
  
  #QFIMS####
  likertcounter = 0
  ##QFIMCHR####
  #Reset var.vector
  var.vector <- c()
  ##Create subset dataframe for Qfimchr Calculations
  ESS2014.qfimchr <- ESS2014.final %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.qfimchr$qfimchr <- gsub("Extremely unimportant",0,as.character(ESS2014.qfimchr$qfimchr))
  ESS2014.qfimchr$qfimchr <- gsub("Extremely important",10,as.character(ESS2014.qfimchr$qfimchr))
  ESS2014.qfimchr$qfimchr <- gsub("Refusal","a",as.character(ESS2014.qfimchr$qfimchr))
  ESS2014.qfimchr$qfimchr <- gsub("Don't know","a",as.character(ESS2014.qfimchr$qfimchr))
  ESS2014.qfimchr$qfimchr <- gsub("No answer","a",as.character(ESS2014.qfimchr$qfimchr))
  #filter out non-responses
  ESS2014.qfimchr <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(qfimchr!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.qfimchr.native <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born") %>%
    mutate(Category = case_when(
      qfimchr == 0 ~ "Extremely Unimportant",
      qfimchr == 10 ~"Extremely Important",
      0 < qfimchr & qfimchr <= 3 ~ "1-3",
      3 < qfimchr & qfimchr <= 6 ~ "4-6",
      6 < qfimchr & qfimchr <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimchr.native$Category)
  likert.qfimchr.native <- ESS2014.qfimchr.native %>%
    ungroup()%>%
    select(Category) 
  likert.qfimchr.native <- as.data.frame(likert.qfimchr.native)
  likert.qfimchr.native <- likert(likert.qfimchr.native)$results[,2:levels.n]
  likert.qfimchr.native$Category <- "Native"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimchr.native
  
  
  #European Immigrant
  ESS2014.qfimchr.EUimm <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant") %>%
    mutate(Category = case_when(
      qfimchr == 0 ~ "Extremely Unimportant",
      qfimchr == 10 ~"Extremely Important",
      0 < qfimchr & qfimchr <= 3 ~ "1-3",
      3 < qfimchr & qfimchr <= 6 ~ "4-6",
      6 < qfimchr & qfimchr <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimchr.EUimm$Category)
  likert.qfimchr.EUimm <- ESS2014.qfimchr.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.qfimchr.EUimm <- as.data.frame(likert.qfimchr.EUimm)
  likert.qfimchr.EUimm <- likert(likert.qfimchr.EUimm)$results[,2:levels.n]
  likert.qfimchr.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimchr.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.qfimchr.nonEU <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant") %>%
    mutate(Category = case_when(
      qfimchr == 0 ~ "Extremely Unimportant",
      qfimchr == 10 ~"Extremely Important",
      0 < qfimchr & qfimchr <= 3 ~ "1-3",
      3 < qfimchr & qfimchr <= 6 ~ "4-6",
      6 < qfimchr & qfimchr <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimchr.nonEU$Category)
  likert.qfimchr.nonEU <- ESS2014.qfimchr.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.qfimchr.nonEU <- as.data.frame(likert.qfimchr.nonEU)
  likert.qfimchr.nonEU <- likert(likert.qfimchr.nonEU)$results[,2:levels.n]
  likert.qfimchr.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimchr.nonEU
  
  
  ##QFIMWHT####
  #Reset var.vector
  var.vector <- c()
  ##Create subset dataframe for qfimwht Calculations
  ESS2014.qfimwht <- ESS2014.final %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.qfimwht$qfimwht <- gsub("Extremely unimportant",0,as.character(ESS2014.qfimwht$qfimwht))
  ESS2014.qfimwht$qfimwht <- gsub("Extremely important",10,as.character(ESS2014.qfimwht$qfimwht))
  ESS2014.qfimwht$qfimwht <- gsub("Refusal","a",as.character(ESS2014.qfimwht$qfimwht))
  ESS2014.qfimwht$qfimwht <- gsub("Don't know","a",as.character(ESS2014.qfimwht$qfimwht))
  ESS2014.qfimwht$qfimwht <- gsub("No answer","a",as.character(ESS2014.qfimwht$qfimwht))
  #filter out non-responses
  ESS2014.qfimwht <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(qfimwht!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.qfimwht.native <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born") %>%
    mutate(Category = case_when(
      qfimwht == 0 ~ "Extremely Unimportant",
      qfimwht == 10 ~"Extremely Important",
      0 < qfimwht & qfimwht <= 3 ~ "1-3",
      3 < qfimwht & qfimwht <= 6 ~ "4-6",
      6 < qfimwht & qfimwht <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimwht.native$Category)
  likert.qfimwht.native <- ESS2014.qfimwht.native %>%
    ungroup()%>%
    select(Category) 
  likert.qfimwht.native <- as.data.frame(likert.qfimwht.native)
  likert.qfimwht.native <- likert(likert.qfimwht.native)$results[,2:levels.n]
  likert.qfimwht.native$Category <- "Native"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimwht.native
  
  #European Immigrant
  ESS2014.qfimwht.EUimm <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      qfimwht == 0 ~ "Extremely Unimportant",
      qfimwht == 10 ~"Extremely Important",
      0 < qfimwht & qfimwht <= 3 ~ "1-3",
      3 < qfimwht & qfimwht <= 6 ~ "4-6",
      6 < qfimwht & qfimwht <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimwht.EUimm$Category)
  likert.qfimwht.EUimm <- ESS2014.qfimwht.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.qfimwht.EUimm <- as.data.frame(likert.qfimwht.EUimm)
  likert.qfimwht.EUimm <- likert(likert.qfimwht.EUimm)$results[,2:levels.n]
  likert.qfimwht.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimwht.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.qfimwht.nonEU <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      qfimwht == 0 ~ "Extremely Unimportant",
      qfimwht == 10 ~"Extremely Important",
      0 < qfimwht & qfimwht <= 3 ~ "1-3",
      3 < qfimwht & qfimwht <= 6 ~ "4-6",
      6 < qfimwht & qfimwht <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimwht.nonEU$Category)
  likert.qfimwht.nonEU <- ESS2014.qfimwht.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.qfimwht.nonEU <- as.data.frame(likert.qfimwht.nonEU)
  likert.qfimwht.nonEU <- likert(likert.qfimwht.nonEU)$results[,2:levels.n]
  likert.qfimwht.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimwht.nonEU
  
  ##QFIMLNG####
  #Reset var.vector
  var.vector <- c()
  ##Create subset dataframe for qfimlng Calculations
  ESS2014.qfimlng <- ESS2014.final %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.qfimlng$qfimlng <- gsub("Extremely unimportant",0,as.character(ESS2014.qfimlng$qfimlng))
  ESS2014.qfimlng$qfimlng <- gsub("Extremely important",10,as.character(ESS2014.qfimlng$qfimlng))
  ESS2014.qfimlng$qfimlng <- gsub("Refusal","a",as.character(ESS2014.qfimlng$qfimlng))
  ESS2014.qfimlng$qfimlng <- gsub("Don't know","a",as.character(ESS2014.qfimlng$qfimlng))
  ESS2014.qfimlng$qfimlng <- gsub("No answer","a",as.character(ESS2014.qfimlng$qfimlng))
  #filter out non-responses
  ESS2014.qfimlng <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(qfimlng!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.qfimlng.native <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      qfimlng == 0 ~ "Extremely Unimportant",
      qfimlng == 10 ~"Extremely Important",
      0 < qfimlng & qfimlng <= 3 ~ "1-3",
      3 < qfimlng & qfimlng <= 6 ~ "4-6",
      6 < qfimlng & qfimlng <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimlng.native$Category)
  likert.qfimlng.native <- ESS2014.qfimlng.native %>%
    ungroup()%>%
    select(Category) 
  likert.qfimlng.native <- as.data.frame(likert.qfimlng.native)
  likert.qfimlng.native <- likert(likert.qfimlng.native)$results[,2:levels.n]
  likert.qfimlng.native$Category <- "Native"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimlng.native
  
  
  #European Immigrant
  ESS2014.qfimlng.EUimm <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      qfimlng == 0 ~ "Extremely Unimportant",
      qfimlng == 10 ~"Extremely Important",
      0 < qfimlng & qfimlng <= 3 ~ "1-3",
      3 < qfimlng & qfimlng <= 6 ~ "4-6",
      6 < qfimlng & qfimlng <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- nlevels(ESS2014.qfimlng.EUimm$Category) + 1
  likert.qfimlng.EUimm <- ESS2014.qfimlng.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.qfimlng.EUimm <- as.data.frame(likert.qfimlng.EUimm)
  likert.qfimlng.EUimm <- likert(likert.qfimlng.EUimm)$results[,2:levels.n]
  likert.qfimlng.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimlng.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.qfimlng.nonEU <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      qfimlng == 0 ~ "Extremely Unimportant",
      qfimlng == 10 ~"Extremely Important",
      0 < qfimlng & qfimlng <= 3 ~ "1-3",
      3 < qfimlng & qfimlng <= 6 ~ "4-6",
      6 < qfimlng & qfimlng <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimlng.nonEU$Category)
  likert.qfimlng.nonEU <- ESS2014.qfimlng.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.qfimlng.nonEU <- as.data.frame(likert.qfimlng.nonEU)
  likert.qfimlng.nonEU <- likert(likert.qfimlng.nonEU)$results[,2:levels.n]
  likert.qfimlng.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimlng.nonEU
  
  ##QFIMCMT####
  #Reset var.vector
  var.vector <- c()
  ##Create subset dataframe for qfimcmt Calculations
  ESS2014.qfimcmt <- ESS2014.final %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.qfimcmt$qfimcmt <- gsub("Extremely unimportant",0,as.character(ESS2014.qfimcmt$qfimcmt))
  ESS2014.qfimcmt$qfimcmt <- gsub("Extremely important",10,as.character(ESS2014.qfimcmt$qfimcmt))
  ESS2014.qfimcmt$qfimcmt <- gsub("Refusal","a",as.character(ESS2014.qfimcmt$qfimcmt))
  ESS2014.qfimcmt$qfimcmt <- gsub("Don't know","a",as.character(ESS2014.qfimcmt$qfimcmt))
  ESS2014.qfimcmt$qfimcmt <- gsub("No answer","a",as.character(ESS2014.qfimcmt$qfimcmt))
  #filter out non-responses
  ESS2014.qfimcmt <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(qfimcmt!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.qfimcmt.native <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      qfimcmt == 0 ~ "Extremely Unimportant",
      qfimcmt == 10 ~"Extremely Important",
      0 < qfimcmt & qfimcmt <= 3 ~ "1-3",
      3 < qfimcmt & qfimcmt <= 6 ~ "4-6",
      6 < qfimcmt & qfimcmt <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimcmt.native$Category)
  likert.qfimcmt.native <- ESS2014.qfimcmt.native %>%
    ungroup()%>%
    select(Category) 
  likert.qfimcmt.native <- as.data.frame(likert.qfimcmt.native)
  likert.qfimcmt.native <- likert(likert.qfimcmt.native)$results[,2:levels.n]
  likert.qfimcmt.native$Category <- "Native"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimcmt.native
  
  
  #European Immigrant
  ESS2014.qfimcmt.EUimm <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      qfimcmt == 0 ~ "Extremely Unimportant",
      qfimcmt == 10 ~"Extremely Important",
      0 < qfimcmt & qfimcmt <= 3 ~ "1-3",
      3 < qfimcmt & qfimcmt <= 6 ~ "4-6",
      6 < qfimcmt & qfimcmt <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimcmt.EUimm$Category)
  likert.qfimcmt.EUimm <- ESS2014.qfimcmt.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.qfimcmt.EUimm <- as.data.frame(likert.qfimcmt.EUimm)
  likert.qfimcmt.EUimm <- likert(likert.qfimcmt.EUimm)$results[,2:levels.n]
  likert.qfimcmt.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimcmt.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.qfimcmt.nonEU <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      qfimcmt == 0 ~ "Extremely Unimportant",
      qfimcmt == 10 ~"Extremely Important",
      0 < qfimcmt & qfimcmt <= 3 ~ "1-3",
      3 < qfimcmt & qfimcmt <= 6 ~ "4-6",
      6 < qfimcmt & qfimcmt <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.qfimcmt.nonEU$Category)
  likert.qfimcmt.nonEU <- ESS2014.qfimcmt.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.qfimcmt.nonEU <- as.data.frame(likert.qfimcmt.nonEU)
  likert.qfimcmt.nonEU <- likert(likert.qfimcmt.nonEU)$results[,2:levels.n]
  likert.qfimcmt.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  QFIM.df[likertcounter,] = likert.qfimcmt.nonEU
  
  
  
  
  
  
  
  
  #Cleanup####
  #Distinguish based on variable
  QFIM.df$Variable[1:3] <- "Christian Background"
  QFIM.df$Variable[4:6] <- "Be White"
  QFIM.df$Variable[7:9] <- "Speak Country's Official Language"
  QFIM.df$Variable[10:12] <- "Committed to Way of Life in Country"
  QFIM.df$Country <- val
  #Create Country specific dataframe to check for missing categories out of the loop
  nam <- paste(val,".QFIM.df",sep="")
  assign(nam,QFIM.df)
  
  
  
  
  #IM####
  likertcounter = 0
  ##IMTCJOB####
  ##Create subset dataframe for imtcjob Calculations
  ESS2014.imtcjob <- ESS2014.final %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.imtcjob$imtcjob <- gsub("Take jobs away",0,as.character(ESS2014.imtcjob$imtcjob))
  ESS2014.imtcjob$imtcjob <- gsub("Create new jobs",10,as.character(ESS2014.imtcjob$imtcjob))
  ESS2014.imtcjob$imtcjob <- gsub("Refusal","a",as.character(ESS2014.imtcjob$imtcjob))
  ESS2014.imtcjob$imtcjob <- gsub("Don't know","a",as.character(ESS2014.imtcjob$imtcjob))
  ESS2014.imtcjob$imtcjob <- gsub("No answer","a",as.character(ESS2014.imtcjob$imtcjob))
  #filter out non-responses
  ESS2014.imtcjob <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(imtcjob!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.imtcjob.native <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      imtcjob == 0 ~ "Extremely Unimportant",
      imtcjob == 10 ~"Extremely Important",
      0 < imtcjob & imtcjob <= 3 ~ "1-3",
      3 < imtcjob & imtcjob <= 6 ~ "4-6",
      6 < imtcjob & imtcjob <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imtcjob.native$Category)
  likert.imtcjob.native <- ESS2014.imtcjob.native %>%
    ungroup()%>%
    select(Category) 
  likert.imtcjob.native <- as.data.frame(likert.imtcjob.native)
  likert.imtcjob.native <- likert(likert.imtcjob.native)$results[,2:levels.n]
  likert.imtcjob.native$Category <- "Native"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imtcjob.native
  
  
  #European Immigrant
  ESS2014.imtcjob.EUimm <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      imtcjob == 0 ~ "Extremely Unimportant",
      imtcjob == 10 ~"Extremely Important",
      0 < imtcjob & imtcjob <= 3 ~ "1-3",
      3 < imtcjob & imtcjob <= 6 ~ "4-6",
      6 < imtcjob & imtcjob <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imtcjob.EUimm$Category)
  likert.imtcjob.EUimm <- ESS2014.imtcjob.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.imtcjob.EUimm <- as.data.frame(likert.imtcjob.EUimm)
  likert.imtcjob.EUimm <- likert(likert.imtcjob.EUimm)$results[,2:levels.n]
  likert.imtcjob.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imtcjob.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.imtcjob.nonEU <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      imtcjob == 0 ~ "Extremely Unimportant",
      imtcjob == 10 ~"Extremely Important",
      0 < imtcjob & imtcjob <= 3 ~ "1-3",
      3 < imtcjob & imtcjob <= 6 ~ "4-6",
      6 < imtcjob & imtcjob <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imtcjob.nonEU$Category)
  likert.imtcjob.nonEU <- ESS2014.imtcjob.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.imtcjob.nonEU <- as.data.frame(likert.imtcjob.nonEU)
  likert.imtcjob.nonEU <- likert(likert.imtcjob.nonEU)$results[,2:levels.n]
  likert.imtcjob.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imtcjob.nonEU
  
  ##IMBLECO####
  ##Create subset dataframe for imbleco Calculations
  ESS2014.imbleco <- ESS2014.final %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.imbleco$imbleco <- gsub("Generally take out more",0,as.character(ESS2014.imbleco$imbleco))
  ESS2014.imbleco$imbleco <- gsub("Generally put in more",10,as.character(ESS2014.imbleco$imbleco))
  ESS2014.imbleco$imbleco <- gsub("Refusal","a",as.character(ESS2014.imbleco$imbleco))
  ESS2014.imbleco$imbleco <- gsub("Don't know","a",as.character(ESS2014.imbleco$imbleco))
  ESS2014.imbleco$imbleco <- gsub("No answer","a",as.character(ESS2014.imbleco$imbleco))
  #filter out non-responses
  ESS2014.imbleco <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(imbleco!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.imbleco.native <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      imbleco == 0 ~ "Extremely Unimportant",
      imbleco == 10 ~"Extremely Important",
      0 < imbleco & imbleco <= 3 ~ "1-3",
      3 < imbleco & imbleco <= 6 ~ "4-6",
      6 < imbleco & imbleco <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imbleco.native$Category)
  likert.imbleco.native <- ESS2014.imbleco.native %>%
    ungroup()%>%
    select(Category) 
  likert.imbleco.native <- as.data.frame(likert.imbleco.native)
  likert.imbleco.native <- likert(likert.imbleco.native)$results[,2:levels.n]
  likert.imbleco.native$Category <- "Native"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imbleco.native
  
  
  #European Immigrant
  ESS2014.imbleco.EUimm <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      imbleco == 0 ~ "Extremely Unimportant",
      imbleco == 10 ~"Extremely Important",
      0 < imbleco & imbleco <= 3 ~ "1-3",
      3 < imbleco & imbleco <= 6 ~ "4-6",
      6 < imbleco & imbleco <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imbleco.EUimm$Category)
  likert.imbleco.EUimm <- ESS2014.imbleco.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.imbleco.EUimm <- as.data.frame(likert.imbleco.EUimm)
  likert.imbleco.EUimm <- likert(likert.imbleco.EUimm)$results[,2:levels.n]
  likert.imbleco.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imbleco.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.imbleco.nonEU <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      imbleco == 0 ~ "Extremely Unimportant",
      imbleco == 10 ~"Extremely Important",
      0 < imbleco & imbleco <= 3 ~ "1-3",
      3 < imbleco & imbleco <= 6 ~ "4-6",
      6 < imbleco & imbleco <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imbleco.nonEU$Category)
  likert.imbleco.nonEU <- ESS2014.imbleco.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.imbleco.nonEU <- as.data.frame(likert.imbleco.nonEU)
  likert.imbleco.nonEU <- likert(likert.imbleco.nonEU)$results[,2:levels.n]
  likert.imbleco.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imbleco.nonEU
  
  
  ##IMWBCRM####
  ##Create subset dataframe for imwbcrm Calculations
  ESS2014.imwbcrm <- ESS2014.final %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.imwbcrm$imwbcrm <- gsub("Crime problems made worse",0,as.character(ESS2014.imwbcrm$imwbcrm))
  ESS2014.imwbcrm$imwbcrm <- gsub("Crime problems made better",10,as.character(ESS2014.imwbcrm$imwbcrm))
  ESS2014.imwbcrm$imwbcrm <- gsub("Refusal","a",as.character(ESS2014.imwbcrm$imwbcrm))
  ESS2014.imwbcrm$imwbcrm <- gsub("Don't know","a",as.character(ESS2014.imwbcrm$imwbcrm))
  ESS2014.imwbcrm$imwbcrm <- gsub("No answer","a",as.character(ESS2014.imwbcrm$imwbcrm))
  #filter out non-responses
  ESS2014.imwbcrm <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(imwbcrm!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.imwbcrm.native <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      imwbcrm == 0 ~ "Extremely Unimportant",
      imwbcrm == 10 ~"Extremely Important",
      0 < imwbcrm & imwbcrm <= 3 ~ "1-3",
      3 < imwbcrm & imwbcrm <= 6 ~ "4-6",
      6 < imwbcrm & imwbcrm <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imwbcrm.native$Category)
  likert.imwbcrm.native <- ESS2014.imwbcrm.native %>%
    ungroup()%>%
    select(Category) 
  likert.imwbcrm.native <- as.data.frame(likert.imwbcrm.native)
  likert.imwbcrm.native <- likert(likert.imwbcrm.native)$results[,2:levels.n]
  likert.imwbcrm.native$Category <- "Native"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imwbcrm.native
  
  
  #European Immigrant
  ESS2014.imwbcrm.EUimm <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      imwbcrm == 0 ~ "Extremely Unimportant",
      imwbcrm == 10 ~"Extremely Important",
      0 < imwbcrm & imwbcrm <= 3 ~ "1-3",
      3 < imwbcrm & imwbcrm <= 6 ~ "4-6",
      6 < imwbcrm & imwbcrm <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imwbcrm.EUimm$Category)
  likert.imwbcrm.EUimm <- ESS2014.imwbcrm.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.imwbcrm.EUimm <- as.data.frame(likert.imwbcrm.EUimm)
  likert.imwbcrm.EUimm <- likert(likert.imwbcrm.EUimm)$results[,2:levels.n]
  likert.imwbcrm.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imwbcrm.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.imwbcrm.nonEU <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      imwbcrm == 0 ~ "Extremely Unimportant",
      imwbcrm == 10 ~"Extremely Important",
      0 < imwbcrm & imwbcrm <= 3 ~ "1-3",
      3 < imwbcrm & imwbcrm <= 6 ~ "4-6",
      6 < imwbcrm & imwbcrm <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.imwbcrm.nonEU$Category)
  likert.imwbcrm.nonEU <- ESS2014.imwbcrm.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.imwbcrm.nonEU <- as.data.frame(likert.imwbcrm.nonEU)
  likert.imwbcrm.nonEU <- likert(likert.imwbcrm.nonEU)$results[,2:levels.n]
  likert.imwbcrm.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.imwbcrm.nonEU
  
  
  
  #5,6,7's
  
  
  ##LWDSCWP####
  ##Create subset dataframe for lwdscwp Calculations
  ESS2014.lwdscwp <- ESS2014.final %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.lwdscwp$lwdscwp <- gsub("Extremely bad",0,as.character(ESS2014.lwdscwp$lwdscwp))
  ESS2014.lwdscwp$lwdscwp <- gsub("Extremely good",10,as.character(ESS2014.lwdscwp$lwdscwp))
  ESS2014.lwdscwp$lwdscwp <- gsub("Refusal","a",as.character(ESS2014.lwdscwp$lwdscwp))
  ESS2014.lwdscwp$lwdscwp <- gsub("Don't know","a",as.character(ESS2014.lwdscwp$lwdscwp))
  ESS2014.lwdscwp$lwdscwp <- gsub("No answer","a",as.character(ESS2014.lwdscwp$lwdscwp))
  #filter out non-responses
  ESS2014.lwdscwp <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(lwdscwp!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.lwdscwp.native <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      lwdscwp == 0 ~ "Extremely Negative",
      lwdscwp == 10 ~"Extremely Positive",
      0 < lwdscwp & lwdscwp <= 3 ~ "1-3",
      3 < lwdscwp & lwdscwp <= 6 ~ "4-6",
      6 < lwdscwp & lwdscwp <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.lwdscwp.native$Category)
  likert.lwdscwp.native <- ESS2014.lwdscwp.native %>%
    ungroup()%>%
    select(Category) 
  likert.lwdscwp.native <- as.data.frame(likert.lwdscwp.native)
  likert.lwdscwp.native <- likert(likert.lwdscwp.native)$results[,2:levels.n]
  likert.lwdscwp.native$Category <- "Native"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.lwdscwp.native
  
  
  #European Immigrant
  ESS2014.lwdscwp.EUimm <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      lwdscwp == 0 ~ "Extremely Negative",
      lwdscwp == 10 ~"Extremely Positive",
      0 < lwdscwp & lwdscwp <= 3 ~ "1-3",
      3 < lwdscwp & lwdscwp <= 6 ~ "4-6",
      6 < lwdscwp & lwdscwp <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.lwdscwp.EUimm$Category)
  likert.lwdscwp.EUimm <- ESS2014.lwdscwp.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.lwdscwp.EUimm <- as.data.frame(likert.lwdscwp.EUimm)
  likert.lwdscwp.EUimm <- likert(likert.lwdscwp.EUimm)$results[,2:levels.n]
  likert.lwdscwp.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.lwdscwp.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.lwdscwp.nonEU <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      lwdscwp == 0 ~ "Extremely Negative",
      lwdscwp == 10 ~"Extremely Positive",
      0 < lwdscwp & lwdscwp <= 3 ~ "1-3",
      3 < lwdscwp & lwdscwp <= 6 ~ "4-6",
      6 < lwdscwp & lwdscwp <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.lwdscwp.nonEU$Category)
  likert.lwdscwp.nonEU <- ESS2014.lwdscwp.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.lwdscwp.nonEU <- as.data.frame(likert.lwdscwp.nonEU)
  likert.lwdscwp.nonEU <- likert(likert.lwdscwp.nonEU)$results[,2:levels.n]
  likert.lwdscwp.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.lwdscwp.nonEU
  
  
  ##RLGUEIM####
  ##Create subset dataframe for rlgueim Calculations
  ESS2014.rlgueim <- ESS2014.final %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  ESS2014.rlgueim$rlgueim <- gsub("Religious beliefs and practices undermined",0,as.character(ESS2014.rlgueim$rlgueim))
  ESS2014.rlgueim$rlgueim <- gsub("Religious beliefs and practices enriched",10,as.character(ESS2014.rlgueim$rlgueim))
  ESS2014.rlgueim$rlgueim <- gsub("Refusal","a",as.character(ESS2014.rlgueim$rlgueim))
  ESS2014.rlgueim$rlgueim <- gsub("Don't know","a",as.character(ESS2014.rlgueim$rlgueim))
  ESS2014.rlgueim$rlgueim <- gsub("No answer","a",as.character(ESS2014.rlgueim$rlgueim))
  #filter out non-responses
  ESS2014.rlgueim <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(rlgueim!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.rlgueim.native <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      rlgueim == 0 ~ "Extremely Negative",
      rlgueim == 10 ~"Extremely Positive",
      0 < rlgueim & rlgueim <= 3 ~ "1-3",
      3 < rlgueim & rlgueim <= 6 ~ "4-6",
      6 < rlgueim & rlgueim <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.rlgueim.native$Category)
  likert.rlgueim.native <- ESS2014.rlgueim.native %>%
    ungroup()%>%
    select(Category) 
  likert.rlgueim.native <- as.data.frame(likert.rlgueim.native)
  likert.rlgueim.native <- likert(likert.rlgueim.native)$results[,2:levels.n]
  likert.rlgueim.native$Category <- "Native"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.rlgueim.native
  
  
  #European Immigrant
  ESS2014.rlgueim.EUimm <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      rlgueim == 0 ~ "Extremely Negative",
      rlgueim == 10 ~"Extremely Positive",
      0 < rlgueim & rlgueim <= 3 ~ "1-3",
      3 < rlgueim & rlgueim <= 6 ~ "4-6",
      6 < rlgueim & rlgueim <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.rlgueim.EUimm$Category)
  likert.rlgueim.EUimm <- ESS2014.rlgueim.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.rlgueim.EUimm <- as.data.frame(likert.rlgueim.EUimm)
  likert.rlgueim.EUimm <- likert(likert.rlgueim.EUimm)$results[,2:levels.n]
  likert.rlgueim.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.rlgueim.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.rlgueim.nonEU <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      rlgueim == 0 ~ "Extremely Negative",
      rlgueim == 10 ~"Extremely Positive",
      0 < rlgueim & rlgueim <= 3 ~ "1-3",
      3 < rlgueim & rlgueim <= 6 ~ "4-6",
      6 < rlgueim & rlgueim <= 9 ~ "7-9" )) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.rlgueim.nonEU$Category)
  likert.rlgueim.nonEU <- ESS2014.rlgueim.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.rlgueim.nonEU <- as.data.frame(likert.rlgueim.nonEU)
  likert.rlgueim.nonEU <- likert(likert.rlgueim.nonEU)$results[,2:levels.n]
  likert.rlgueim.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  IM.df[likertcounter,] = likert.rlgueim.nonEU
  
  
  
  #Cleanup####
  #Distinguish based on variable
  IM.df$Variable[1:3] <- "Take jobs away in country or create new jobs"
  IM.df$Variable[4:6] <- "Take out more (taxes and services) than they put in or less"
  IM.df$Variable[7:9] <- "Make country's crime problems worse or better "
  IM.df$Variable[10:12] <- "Law against ethnic discrimination in workplace good/bad for a country"
  IM.df$Variable[13:15] <- "Religious beliefs and practices undermined or enriched by immigrants"
  
  IM.df$Country <- val
  #Create Country specific dataframe to check for missing categories out of the loop
  nam <- paste(val,".IM.df",sep="")
  assign(nam,IM.df)
  #1-5####
  likertcounter = 0
  #REMEMBER ORDER OF LIKERT IS SWITCHED FOR THIS
  ##PPLSTRD####
  ##Create subset dataframe for pplstrd Calculations
  ESS2014.pplstrd <- ESS2014.final %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  #gsub first response into 1, which then makes all responses 1-7
  ESS2014.pplstrd$pplstrd <- gsub("Agree Strongly",1,as.numeric(ESS2014.pplstrd$pplstrd))
  #because last 3 responses (refusal, dont know, no answer) become 6,7,8 instead of 7,8,9
  #i gsub 5,6,7 to the same value "a"
  ESS2014.pplstrd$pplstrd <- gsub(6,"a",as.character(ESS2014.pplstrd$pplstrd))
  ESS2014.pplstrd$pplstrd <- gsub(7,"a",as.character(ESS2014.pplstrd$pplstrd))
  ESS2014.pplstrd$pplstrd <- gsub(8,"a",as.character(ESS2014.pplstrd$pplstrd))
  #filter out non-responses
  ESS2014.pplstrd <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(pplstrd!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.pplstrd.native <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")%>%
    mutate(Category = case_when(
      pplstrd == 1 ~ "Agree Strongly",
      pplstrd == 2 ~"Agree",
      pplstrd == 3 ~"Neither agree nor disagree",
      pplstrd == 4 ~"Disagree",
      pplstrd == 5 ~"Disagree Strongly")) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.pplstrd.native$Category)
  likert.pplstrd.native <- ESS2014.pplstrd.native %>%
    ungroup()%>%
    select(Category) 
  likert.pplstrd.native <- as.data.frame(likert.pplstrd.native)
  likert.pplstrd.native <- likert(likert.pplstrd.native)$results[,2:levels.n]
  likert.pplstrd.native$Category <- "Native"
  likertcounter = likertcounter + 1
  PPLSTRD.df[likertcounter,] = likert.pplstrd.native
  
  #European Immigrant
  ESS2014.pplstrd.EUimm <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")%>%
    mutate(Category = case_when(
      pplstrd == 1 ~ "Agree Strongly",
      pplstrd == 2 ~"Agree",
      pplstrd == 3 ~"Neither agree nor disagree",
      pplstrd == 4 ~"Disagree",
      pplstrd == 5 ~"Disagree Strongly")) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.pplstrd.EUimm$Category)
  likert.pplstrd.EUimm <- ESS2014.pplstrd.EUimm %>%
    ungroup()%>%
    select(Category) 
  likert.pplstrd.EUimm <- as.data.frame(likert.pplstrd.EUimm)
  likert.pplstrd.EUimm <- likert(likert.pplstrd.EUimm)$results[,2:levels.n]
  likert.pplstrd.EUimm$Category <- "European Immigrant"
  likertcounter = likertcounter + 1
  PPLSTRD.df[likertcounter,] = likert.pplstrd.EUimm
  
  
  #Non-EU Immigrants
  ESS2014.pplstrd.nonEU <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")%>%
    mutate(Category = case_when(
      pplstrd == 1 ~ "Agree Strongly",
      pplstrd == 2 ~"Agree",
      pplstrd == 3 ~"Neither agree nor disagree",
      pplstrd == 4 ~"Disagree",
      pplstrd == 5 ~"Disagree Strongly")) %>%
    mutate_at(vars(Category),as.factor)
  #set factors
  levels.n <- 1 + nlevels(ESS2014.pplstrd.nonEU$Category)
  likert.pplstrd.nonEU <- ESS2014.pplstrd.nonEU %>%
    ungroup()%>%
    select(Category) 
  likert.pplstrd.nonEU <- as.data.frame(likert.pplstrd.nonEU)
  likert.pplstrd.nonEU <- likert(likert.pplstrd.nonEU)$results[,2:levels.n]
  likert.pplstrd.nonEU$Category <- "Non-European Immigrant"
  likertcounter = likertcounter + 1
  PPLSTRD.df[likertcounter,] = likert.pplstrd.nonEU
  
  
  #Cleanup####
  #Distinguish based on variable
  PPLSTRD.df$Country <- val
  #Create Country specific dataframe to check for missing categories out of the loop
  nam <- paste(val,".PPLSTRD.df",sep="")
  assign(nam,PPLSTRD.df)
}
#deleting for memory space
rm(ESS2014.immigrant,ESS2014.nonimmigrant,ESS2014.a,ESS14,ESS2014)

#Dataset Cleanups####
#France####
#QFIM (CMT.EUimm missing 'Extremely Unimportant' Value)
France.QFIM.df[11,6] <- France.QFIM.df[11,5]
France.QFIM.df[11,5] <- 0
#Germany####
#QFIM (WHT.EUimm/Non EU imm missing 'Extremely Important' Value)
Germany.QFIM.df[c(5:6),6] <- Germany.QFIM.df[c(5:6),5]
Germany.QFIM.df[c(5:6),5] <- Germany.QFIM.df[c(5:6),4]
Germany.QFIM.df[c(5:6),4] <- 0
#Spain####
#IM (TCJOB.EUIMM & BLECO.EUIMM Missing 'Extremely Unimportant',BWCRM.EUimm/NonEU missing 'Extremely Important')
Spain.IM.df[c(2,5,8,9),6] <- Spain.IM.df[c(2,5,8,9),5]
Spain.IM.df[c(8,9),5] <- Spain.IM.df[c(8,9),4]
Spain.IM.df[14,6] <- Spain.IM.df[14,5]
Spain.IM.df[14,5] <- 0
Spain.IM.df[c(8,9),4] <- 0
Spain.IM.df[c(2,5),5] <- 0
#Sweden####
#QFIM (WHT.Native/NonEU missing 'Extremely Important')
Sweden.QFIM.df[c(4,6),6] <- Sweden.QFIM.df[c(4,6),5]
Sweden.QFIM.df[c(4,6),5] <- Sweden.QFIM.df[c(4,6),4]
Sweden.QFIM.df[c(4,6),4] <- 0
#IM (BLECO.NonEU missing 'Take out more Taxes', WBCRM.EUimm missing 'Crime Problems Made Better')
Sweden.IM.df[c(6,8),6] <- Sweden.IM.df[c(6,8),5]
Sweden.IM.df[8,5] <- Sweden.IM.df[8,4]
Sweden.IM.df[8,4] <- 0
Sweden.IM.df[6,5] <- 0
#UK####
#QFIM (LNG.EUimm missing "1-3")
`United Kingdom.QFIM.df`[8,6] <- `United Kingdom.QFIM.df`[8,5]
`United Kingdom.QFIM.df`[8,5] <- `United Kingdom.QFIM.df`[8,4]
`United Kingdom.QFIM.df`[8,4] <- `United Kingdom.QFIM.df`[8,3]
`United Kingdom.QFIM.df`[8,3] <- `United Kingdom.QFIM.df`[8,2]
`United Kingdom.QFIM.df`[8,2] <- `United Kingdom.QFIM.df`[8,1]
`United Kingdom.QFIM.df`[8,1] <- 0
#IM (BLECO.EUimm missing 'Generally Put in More', BWCRM.NonEU missing 'Crime Problems Made Better')
`United Kingdom.IM.df`[c(5,9),6] <- `United Kingdom.IM.df`[c(5,9),5]
`United Kingdom.IM.df`[c(5,9),5] <- `United Kingdom.IM.df`[c(5,9),4]
`United Kingdom.IM.df`[c(5,9),4] <- 0





#Creating One Dataframe for Plots####
QFIM.df <- rbind(France.QFIM.df,Germany.QFIM.df,Spain.QFIM.df,Sweden.QFIM.df,`United Kingdom.QFIM.df`)
#reordering to fit likert() syntax
QFIM.df <- QFIM.df[,c(6,7,5,1,2,3,4,8)]
IM.df <- rbind(France.IM.df,Germany.IM.df,Spain.IM.df,Sweden.IM.df,`United Kingdom.IM.df`)
IM.df <- IM.df[,c(6,7,5,1,2,3,4,8)]
PPLSTRD.df <- rbind(France.PPLSTRD.df,Germany.PPLSTRD.df,Spain.PPLSTRD.df,Sweden.PPLSTRD.df,`United Kingdom.PPLSTRD.df`)
PPLSTRD.df <- PPLSTRD.df[,c(6,7,4,3,5,1,2)]

#Plotting####
for (val in countries){
  #QFIM Likert####
  #create temporary QFIM df based on specified country
  tempdf.QFIM<- QFIM.df %>%
    filter(Country == val) %>%
    select(!Country) %>%
    rename(Item = Variable)
  #Convert columns into factors or numeric for likert()
  tempdf.QFIM$Category <- factor(tempdf.QFIM$Category)
  grouping <- relevel(tempdf.QFIM$Category,"Non-European Immigrant","European Immigrant","Native")
  tempdf.QFIM$Item <- factor(tempdf.QFIM$Item)
  tempdf.QFIM$`Extremely Unimportant` <- as.numeric(tempdf.QFIM$`Extremely Unimportant`)
  tempdf.QFIM$`Extremely Important` <- as.numeric(tempdf.QFIM$`Extremely Important`)
  #title of plot based on specified country
  titlename <- paste(val,"Qualifications for Immigrants",sep=" ")
  
  #Plot
  QFIM.plot <- plot(likert(summary=tempdf.QFIM[,c(2:7)],
                           grouping=grouping),
                    plot.percents = TRUE) +
    scale_fill_manual(values = brewer.pal(n=5,"RdYlGn"),breaks = c("Extremely Unimportant",
                                                                 "1-3",
                                                                 "4-6",
                                                                 "7-9",
                                                                 "Extremely Important"))+
    labs(title = titlename)+
    guides(fill = guide_legend(title = "Responses")) +
    theme(plot.title = element_text(hjust = 0.5))
  #Saving Plot into unique variable
  nam <- paste(val,".plot.QFIM",sep="")
  assign(nam,QFIM.plot)
  #IM likert####
  #create temporary IM df based on specified country
  tempdf.IM<- IM.df %>%
    filter(Country == val) %>%
    select(!Country) %>%
    rename(Item = Variable)
  #Convert columns into factors or numeric for likert()
  tempdf.IM$Category <- factor(tempdf.IM$Category)
  grouping <- relevel(tempdf.IM$Category,"Non-European Immigrant","European Immigrant","Native")
  tempdf.IM$Item <- factor(tempdf.IM$Item)
  tempdf.IM$`Extremely Negative` <- as.numeric(tempdf.IM$`Extremely Negative`)
  tempdf.IM$`Extremely Positive` <- as.numeric(tempdf.IM$`Extremely Positive`)
  #title of plot based on specified country
  titlename <- paste(val,"Opinion on Immigrants",sep=" ")
  #Plot
  IM.plot <- plot(likert(summary=tempdf.IM[,c(2:7)],grouping=grouping),
                    plot.percents = TRUE) +
    scale_fill_manual(values = brewer.pal(n=5,"RdYlGn"),breaks = c("Extremely Negative",
                                                                   "1-3",
                                                                   "4-6",
                                                                   "7-9",
                                                                   "Extremely Positive")) +
    labs(title = titlename)+
    guides(fill = guide_legend(title = "Responses")) +
    theme(plot.title = element_text(hjust = 0.5))
  #Saving plot into unique variable
  nam <- paste(val,".plot.IM",sep="")
  assign(nam,IM.plot)
}

#PPLSTD Plot####
#Requires one plot with all countries rather than country specific plot
tempdf.PPLSTRD<- PPLSTRD.df %>%
  rename(Item = Country)
tempdf.PPLSTRD$Category <- factor(tempdf.PPLSTRD$Category)
grouping <- relevel(tempdf.PPLSTRD$Category,"Non-European Immigrant","European Immigrant","Native")
tempdf.PPLSTRD$Item <- factor(tempdf.PPLSTRD$Item)
tempdf.PPLSTRD$`Disagree Strongly` <- as.numeric(tempdf.PPLSTRD$`Disagree Strongly`)
tempdf.PPLSTRD$`Disagree` <- as.numeric(tempdf.PPLSTRD$`Disagree`)
tempdf.PPLSTRD$`Neither Agree nor Disagree` <- as.numeric(tempdf.PPLSTRD$`Neither Agree nor Disagree`)
tempdf.PPLSTRD$`Agree` <- as.numeric(tempdf.PPLSTRD$`Agree`)
tempdf.PPLSTRD$`Agree Strongly` <- as.numeric(tempdf.PPLSTRD$`Agree Strongly`)
PPLSTRD.plot <- plot(likert(summary=tempdf.PPLSTRD[,c(2:7)],grouping=grouping),
                     plot.percents = TRUE) +
  scale_fill_manual(values = brewer.pal(n=5,"RdYlGn"),breaks = c("Disagree Strongly",
                                                                 "Disagree",
                                                                 "Neither Agree nor Disagree",
                                                                 "Agree",
                                                                 "Agree Strongly"))+
  labs(title = "Better for a country if almost everyone shares customs and traditions")+
  guides(fill = guide_legend(title = "Responses")) +
  theme(plot.title = element_text(hjust = 0.5))

#Plots for viewing and Export####
PPLSTRD.plot
France.plot.IM
France.plot.QFIM
Germany.plot.QFIM
Germany.plot.IM
Spain.plot.QFIM
Spain.plot.IM
Sweden.plot.QFIM
Sweden.plot.IM
`United Kingdom.plot.QFIM`
`United Kingdom.plot.IM`

