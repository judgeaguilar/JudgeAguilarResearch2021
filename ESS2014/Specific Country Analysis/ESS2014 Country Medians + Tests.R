###############################
#Clear Workspace Image
rm(list=ls())

#set working directory
setwd("C:/Users/cherr/Desktop/USC Research/ESS Datasets")

#load packages
library(tidyverse)
library(dplyr)
library(tidyr)
library(foreign)
library(car)
library(ggpubr)
###############################
#Create Country list 
countries <- c("United Kingdom","France","Germany","Spain","Sweden")
noimbro.vector <- c()
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




####Loop####
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
  
  
  #Final Dataframe Creation for later
  #Create fillable var vector that appends final values into DF
  var.vector <- c()
  #Create DF and Column Names / Row names based on calculation order
  df <- data.frame(matrix(ncol=11,nrow=11))
  colnames(df) <- c("Total Responses",'Total Native Born','Median Native Born','Total EU Immigrant','Median EU Immigrant','Total Non-EU Immigrant','Median Non-EU Immigrant','Kruskal-Willis Test P-Value','(EU Immigrants vs. Native Born) WRS Test P-Value','(Non-EU Immigrants vs. Native Born) WRS Test P-Value','(EU Immigrants vs. Non-EU Immigrants) WRS Test P-Value')
  rownames(df) <- c("qfimchr",'qfimwht','qfimlng','qfimcmt','eimpcnt','imtcjob','imbleco','imwbcrm','pplstrd','lwdscwp','rlgueim')
  #counter for use in dataframe by row
  counter = 0 
  
  #QFIM Values####
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.qfimchr.EUimm <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.qfimchr.nonEU <- ESS2014.qfimchr %>%
    select(qfimchr,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the qfimchr variable a numeric type
  ESS2014.qfimchr$qfimchr <- as.numeric(ESS2014.qfimchr$qfimchr)
  
  #Calculate Summary Statistics
  summary.qfimchr <- group_by(ESS2014.qfimchr, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(qfimchr, na.rm = TRUE),
      median = median(qfimchr, na.rm = TRUE),
      IQR = IQR(qfimchr, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.qfimchr <- ggboxplot(ESS2014.qfimchr, x = "ImmigrantStatus", y = "qfimchr", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "qfimchr", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(qfimchr ~ ImmigrantStatus, data = ESS2014.qfimchr)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.qfimchr.EUimm$qfimchr),as.numeric(ESS2014.qfimchr.nonEU$qfimchr),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.qfimchr.EUimm$qfimchr),as.numeric(ESS2014.qfimchr.native$qfimchr),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.qfimchr.nonEU$qfimchr),as.numeric(ESS2014.qfimchr.native$qfimchr),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.qfimchr$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.qfimchr$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.qfimchr$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimchr$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimchr$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimchr$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimchr$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.qfimwht.EUimm <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.qfimwht.nonEU <- ESS2014.qfimwht %>%
    select(qfimwht,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the qfimwht variable a numeric type
  ESS2014.qfimwht$qfimwht <- as.numeric(ESS2014.qfimwht$qfimwht)
  
  #Calculate Summary Statistics
  summary.qfimwht <- group_by(ESS2014.qfimwht, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(qfimwht, na.rm = TRUE),
      median = median(qfimwht, na.rm = TRUE),
      IQR = IQR(qfimwht, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.qfimwht <- ggboxplot(ESS2014.qfimwht, x = "ImmigrantStatus", y = "qfimwht", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "qfimwht", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(qfimwht ~ ImmigrantStatus, data = ESS2014.qfimwht)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.qfimwht.EUimm$qfimwht),as.numeric(ESS2014.qfimwht.nonEU$qfimwht),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.qfimwht.EUimm$qfimwht),as.numeric(ESS2014.qfimwht.native$qfimwht),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.qfimwht.nonEU$qfimwht),as.numeric(ESS2014.qfimwht.native$qfimwht),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.qfimwht$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.qfimwht$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.qfimwht$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimwht$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimwht$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimwht$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimwht$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.qfimlng.EUimm <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.qfimlng.nonEU <- ESS2014.qfimlng %>%
    select(qfimlng,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the qfimlng variable a numeric type
  ESS2014.qfimlng$qfimlng <- as.numeric(ESS2014.qfimlng$qfimlng)
  
  #Calculate Summary Statistics
  summary.qfimlng <- group_by(ESS2014.qfimlng, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(qfimlng, na.rm = TRUE),
      median = median(qfimlng, na.rm = TRUE),
      IQR = IQR(qfimlng, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.qfimlng <- ggboxplot(ESS2014.qfimlng, x = "ImmigrantStatus", y = "qfimlng", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "qfimlng", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(qfimlng ~ ImmigrantStatus, data = ESS2014.qfimlng)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.qfimlng.EUimm$qfimlng),as.numeric(ESS2014.qfimlng.nonEU$qfimlng),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.qfimlng.EUimm$qfimlng),as.numeric(ESS2014.qfimlng.native$qfimlng),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.qfimlng.nonEU$qfimlng),as.numeric(ESS2014.qfimlng.native$qfimlng),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.qfimlng$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.qfimlng$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.qfimlng$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimlng$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimlng$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimlng$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimlng$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.qfimcmt.EUimm <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.qfimcmt.nonEU <- ESS2014.qfimcmt %>%
    select(qfimcmt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the qfimcmt variable a numeric type
  ESS2014.qfimcmt$qfimcmt <- as.numeric(ESS2014.qfimcmt$qfimcmt)
  
  #Calculate Summary Statistics
  summary.qfimcmt <- group_by(ESS2014.qfimcmt, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(qfimcmt, na.rm = TRUE),
      median = median(qfimcmt, na.rm = TRUE),
      IQR = IQR(qfimcmt, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.qfimcmt <- ggboxplot(ESS2014.qfimcmt, x = "ImmigrantStatus", y = "qfimcmt", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "qfimcmt", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(qfimcmt ~ ImmigrantStatus, data = ESS2014.qfimcmt)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.qfimcmt.EUimm$qfimcmt),as.numeric(ESS2014.qfimcmt.nonEU$qfimcmt),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.qfimcmt.EUimm$qfimcmt),as.numeric(ESS2014.qfimcmt.native$qfimcmt),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.qfimcmt.nonEU$qfimcmt),as.numeric(ESS2014.qfimcmt.native$qfimcmt),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.qfimcmt$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.qfimcmt$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.qfimcmt$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimcmt$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimcmt$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimcmt$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.qfimcmt$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  #IM Values####
  ##IMTCJOB####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.imtcjob.EUimm <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.imtcjob.nonEU <- ESS2014.imtcjob %>%
    select(imtcjob,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the imtcjob variable a numeric type
  ESS2014.imtcjob$imtcjob <- as.numeric(ESS2014.imtcjob$imtcjob)
  
  #Calculate Summary Statistics
  summary.imtcjob <- group_by(ESS2014.imtcjob, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(imtcjob, na.rm = TRUE),
      median = median(imtcjob, na.rm = TRUE),
      IQR = IQR(imtcjob, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.imtcjob <- ggboxplot(ESS2014.imtcjob, x = "ImmigrantStatus", y = "imtcjob", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "imtcjob", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(imtcjob ~ ImmigrantStatus, data = ESS2014.imtcjob)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.imtcjob.EUimm$imtcjob),as.numeric(ESS2014.imtcjob.nonEU$imtcjob),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.imtcjob.EUimm$imtcjob),as.numeric(ESS2014.imtcjob.native$imtcjob),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.imtcjob.nonEU$imtcjob),as.numeric(ESS2014.imtcjob.native$imtcjob),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.imtcjob$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.imtcjob$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.imtcjob$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.imtcjob$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.imtcjob$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imtcjob$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imtcjob$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  
  ##IMBLECO####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.imbleco.EUimm <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.imbleco.nonEU <- ESS2014.imbleco %>%
    select(imbleco,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the imbleco variable a numeric type
  ESS2014.imbleco$imbleco <- as.numeric(ESS2014.imbleco$imbleco)
  
  #Calculate Summary Statistics
  summary.imbleco <- group_by(ESS2014.imbleco, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(imbleco, na.rm = TRUE),
      median = median(imbleco, na.rm = TRUE),
      IQR = IQR(imbleco, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.imbleco <- ggboxplot(ESS2014.imbleco, x = "ImmigrantStatus", y = "imbleco", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "imbleco", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(imbleco ~ ImmigrantStatus, data = ESS2014.imbleco)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.imbleco.EUimm$imbleco),as.numeric(ESS2014.imbleco.nonEU$imbleco),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.imbleco.EUimm$imbleco),as.numeric(ESS2014.imbleco.native$imbleco),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.imbleco.nonEU$imbleco),as.numeric(ESS2014.imbleco.native$imbleco),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.imbleco$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.imbleco$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.imbleco$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.imbleco$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.imbleco$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imbleco$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imbleco$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  
  ##IMWBCRM####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.imwbcrm.EUimm <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.imwbcrm.nonEU <- ESS2014.imwbcrm %>%
    select(imwbcrm,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the imwbcrm variable a numeric type
  ESS2014.imwbcrm$imwbcrm <- as.numeric(ESS2014.imwbcrm$imwbcrm)
  
  #Calculate Summary Statistics
  summary.imwbcrm <- group_by(ESS2014.imwbcrm, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(imwbcrm, na.rm = TRUE),
      median = median(imwbcrm, na.rm = TRUE),
      IQR = IQR(imwbcrm, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.imwbcrm <- ggboxplot(ESS2014.imwbcrm, x = "ImmigrantStatus", y = "imwbcrm", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "imwbcrm", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(imwbcrm ~ ImmigrantStatus, data = ESS2014.imwbcrm)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.imwbcrm.EUimm$imwbcrm),as.numeric(ESS2014.imwbcrm.nonEU$imwbcrm),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.imwbcrm.EUimm$imwbcrm),as.numeric(ESS2014.imwbcrm.native$imwbcrm),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.imwbcrm.nonEU$imwbcrm),as.numeric(ESS2014.imwbcrm.native$imwbcrm),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.imwbcrm$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.imwbcrm$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.imwbcrm$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.imwbcrm$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.imwbcrm$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imwbcrm$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.imwbcrm$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  
  #Other Values####
  ##EIMPCNT####
  #Reset var.vector
  var.vector <- c()
  ##Create subset dataframe for eimpcnt Calculations
  ESS2014.eimpcnt <- ESS2014.final %>%
    select(eimpcnt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)
  #gsub text values
  #gsub first response into 1, which then makes all responses 1-7
  ESS2014.eimpcnt$eimpcnt <- gsub("Allow many to come and live here",1,as.numeric(ESS2014.eimpcnt$eimpcnt))
  #because last 3 responses (refusal, dont know, no answer) become 5,6,7 instead of 7,8,9
  #i gsub 5,6,7 to the same value "a"
  ESS2014.eimpcnt$eimpcnt <- gsub(5,"a",as.character(ESS2014.eimpcnt$eimpcnt))
  ESS2014.eimpcnt$eimpcnt <- gsub(6,"a",as.character(ESS2014.eimpcnt$eimpcnt))
  ESS2014.eimpcnt$eimpcnt <- gsub(7,"a",as.character(ESS2014.eimpcnt$eimpcnt))
  #filter out non-responses
  ESS2014.eimpcnt <- ESS2014.eimpcnt %>%
    select(eimpcnt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus) %>%
    filter(eimpcnt!="a")
  
  ##Create subset dataframes (for Wilcoxon Sum Rank Test)
  #Native Born
  ESS2014.eimpcnt.native <- ESS2014.eimpcnt %>%
    select(eimpcnt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.eimpcnt.EUimm <- ESS2014.eimpcnt %>%
    select(eimpcnt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.eimpcnt.nonEU <- ESS2014.eimpcnt %>%
    select(eimpcnt,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the eimpcnt variable a numeric type
  ESS2014.eimpcnt$eimpcnt <- as.numeric(ESS2014.eimpcnt$eimpcnt)
  
  #Calculate Summary Statistics
  summary.eimpcnt <- group_by(ESS2014.eimpcnt, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(eimpcnt, na.rm = TRUE),
      median = median(eimpcnt, na.rm = TRUE),
      IQR = IQR(eimpcnt, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.eimpcnt <- ggboxplot(ESS2014.eimpcnt, x = "ImmigrantStatus", y = "eimpcnt", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "eimpcnt", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(eimpcnt ~ ImmigrantStatus, data = ESS2014.eimpcnt)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.eimpcnt.EUimm$eimpcnt),as.numeric(ESS2014.eimpcnt.nonEU$eimpcnt),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.eimpcnt.EUimm$eimpcnt),as.numeric(ESS2014.eimpcnt.native$eimpcnt),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.eimpcnt.nonEU$eimpcnt),as.numeric(ESS2014.eimpcnt.native$eimpcnt),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.eimpcnt$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.eimpcnt$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.eimpcnt$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.eimpcnt$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.eimpcnt$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.eimpcnt$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.eimpcnt$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  ##LWDSCWP####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.lwdscwp.EUimm <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.lwdscwp.nonEU <- ESS2014.lwdscwp %>%
    select(lwdscwp,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the lwdscwp variable a numeric type
  ESS2014.lwdscwp$lwdscwp <- as.numeric(ESS2014.lwdscwp$lwdscwp)
  
  #Calculate Summary Statistics
  summary.lwdscwp <- group_by(ESS2014.lwdscwp, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(lwdscwp, na.rm = TRUE),
      median = median(lwdscwp, na.rm = TRUE),
      IQR = IQR(lwdscwp, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.lwdscwp <- ggboxplot(ESS2014.lwdscwp, x = "ImmigrantStatus", y = "lwdscwp", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "lwdscwp", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(lwdscwp ~ ImmigrantStatus, data = ESS2014.lwdscwp)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.lwdscwp.EUimm$lwdscwp),as.numeric(ESS2014.lwdscwp.nonEU$lwdscwp),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.lwdscwp.EUimm$lwdscwp),as.numeric(ESS2014.lwdscwp.native$lwdscwp),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.lwdscwp.nonEU$lwdscwp),as.numeric(ESS2014.lwdscwp.native$lwdscwp),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.lwdscwp$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.lwdscwp$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.lwdscwp$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.lwdscwp$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.lwdscwp$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.lwdscwp$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.lwdscwp$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  ##PPLSTRD####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.pplstrd.EUimm <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.pplstrd.nonEU <- ESS2014.pplstrd %>%
    select(pplstrd,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the pplstrd variable a numeric type
  ESS2014.pplstrd$pplstrd <- as.numeric(ESS2014.pplstrd$pplstrd)
  
  #Calculate Summary Statistics
  summary.pplstrd <- group_by(ESS2014.pplstrd, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(pplstrd, na.rm = TRUE),
      median = median(pplstrd, na.rm = TRUE),
      IQR = IQR(pplstrd, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.pplstrd <- ggboxplot(ESS2014.pplstrd, x = "ImmigrantStatus", y = "pplstrd", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "pplstrd", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(pplstrd ~ ImmigrantStatus, data = ESS2014.pplstrd)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.pplstrd.EUimm$pplstrd),as.numeric(ESS2014.pplstrd.nonEU$pplstrd),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.pplstrd.EUimm$pplstrd),as.numeric(ESS2014.pplstrd.native$pplstrd),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.pplstrd.nonEU$pplstrd),as.numeric(ESS2014.pplstrd.native$pplstrd),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.pplstrd$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.pplstrd$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.pplstrd$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.pplstrd$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.pplstrd$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.pplstrd$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.pplstrd$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  ##RLGUEIM####
  #Reset var.vector
  var.vector <- c()
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
    filter(ImmigrantStatus == "Native-Born")
  
  #European Immigrant
  ESS2014.rlgueim.EUimm <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "European Immigrant")
  
  #Non-EU Immigrants
  ESS2014.rlgueim.nonEU <- ESS2014.rlgueim %>%
    select(rlgueim,ImmigrantStatus) %>%
    group_by(ImmigrantStatus)%>%
    filter(ImmigrantStatus == "Non-European Immigrant")
  
  ##Summary statistics
  #make the rlgueim variable a numeric type
  ESS2014.rlgueim$rlgueim <- as.numeric(ESS2014.rlgueim$rlgueim)
  
  #Calculate Summary Statistics
  summary.rlgueim <- group_by(ESS2014.rlgueim, ImmigrantStatus) %>%
    summarise(
      count = n(),
      sd = sd(rlgueim, na.rm = TRUE),
      median = median(rlgueim, na.rm = TRUE),
      IQR = IQR(rlgueim, na.rm = TRUE)
    )
  
  
  #visualization
  #plot.rlgueim <- ggboxplot(ESS2014.rlgueim, x = "ImmigrantStatus", y = "rlgueim", 
  #          color = "ImmigrantStatus", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  #          ylab = "rlgueim", xlab = "Immigrant Status")
  
  ##kruskal test & wilcoxon-sum rank tests
  #Kruskal
  sig <- kruskal.test(rlgueim ~ ImmigrantStatus, data = ESS2014.rlgueim)
  #WSR Test (EU vs. Non EU)
  mw.EUnonEU <- wilcox.test(as.numeric(ESS2014.rlgueim.EUimm$rlgueim),as.numeric(ESS2014.rlgueim.nonEU$rlgueim),paired=FALSE)
  #WSR Test (EU vs. Native Born)
  mw.EUnative <- wilcox.test(as.numeric(ESS2014.rlgueim.EUimm$rlgueim),as.numeric(ESS2014.rlgueim.native$rlgueim),paired=FALSE)
  #WSR Test (Non EU vs Native Born)
  mw.nonEUnative <- wilcox.test(as.numeric(ESS2014.rlgueim.nonEU$rlgueim),as.numeric(ESS2014.rlgueim.native$rlgueim),paired=FALSE)
  
  ##Values added on to var.vector 
  #Total Responses
  var.vector <- append(var.vector,sum(summary.rlgueim$count))
  #Total Native Responses
  var.vector <- append(var.vector,summary.rlgueim$count[2])
  #Median Native Responses
  var.vector <- append(var.vector,summary.rlgueim$median[2])
  #Total EU Immigrant Responses
  var.vector <- append(var.vector,summary.rlgueim$count[1])
  #Median EU Immigrant Responses
  var.vector <- append(var.vector,summary.rlgueim$median[1])
  #Total Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.rlgueim$count[3])
  #Median Non-EU Immigrant Responses
  var.vector <- append(var.vector,summary.rlgueim$median[3])
  #P-Value of Kruskal Willis
  var.vector <- append(var.vector,sig$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.EUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (Non-EU Immigrants vs. Native Born)
  var.vector <- append(var.vector,mw.nonEUnative$p.value)
  #P-Value of Wilcoxon Sum Rank Test (EU Immigrants vs. Non-EU Immigrants)
  var.vector <- append(var.vector,mw.EUnonEU$p.value)
  
  ##add entire vector to dataframe
  counter = counter + 1
  #for loop purposes (counter = to the row of the variable)
  df[counter,] = var.vector
  
  
  
  ##Other DF columns####
  #P-Value significance check for easy viewing
  #Kruskal Willis
  df$'Kruskal-Willis Significance (0.05)' <- ifelse(df$`Kruskal-Willis Test P-Value` < 0.05,"Y","N")
  #Wilcox (EU vs. Native)
  df$'(EU Immigrant vs. Native-Born) WSR Test Significance (0.05)'<- ifelse(df$`(EU Immigrants vs. Native Born) WRS Test P-Value` < 0.05,"Y","N")
  #Wilcox (Non-EU vs. Native)
  df$'(Non-EU Immigrant vs. Native-Born) WSR Test Significance (0.05)'<- ifelse(df$`(Non-EU Immigrants vs. Native Born) WRS Test P-Value` < 0.05,"Y","N")
  #Wilcox (EU vs. Non-EU)
  df$'(EU Immigrant vs. Non-EU Immigrant) WSR Test Significance (0.05)'<- ifelse(df$`(EU Immigrants vs. Non-EU Immigrants) WRS Test P-Value` < 0.05,"Y","N")
  #rearrange columns for better viewing
  df <- df[,c(1,2,3,4,5,6,7,8,12,9,13,10,14,11,15)]
  #export dataset 
  path <- sprintf('ESS2014Medians+Tests_%s.csv',val)
  write.csv(df,file = path)
}



