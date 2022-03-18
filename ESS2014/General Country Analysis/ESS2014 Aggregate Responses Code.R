#clear global environment 
rm(list=ls())

#set working directory
setwd("C:/Users/cherr/Desktop/USC Research/ESS Datasets")

#loading in data packages for use today
library(tidyverse)
library(dplyr)
library(tidyr)
library(foreign)
###############################################################

#Load in ESS14 Data
ESS14 <- read.spss("ESS7e02_2 (2014).sav")

#create Main ESS2014 Dataframe (ESS14 Translated)
ESS2014 <- as.data.frame(ESS14)

#create dummy CountryCode variable in Main ESS2014 Dataframe
#to make a permanent variable that has country codes, instead of full country name
ESS2014$CountryCode <- ESS2014$cntbrthc

#change CountryCode variables for simplified use later
#NEW
ESS2014$CountryCode<-gsub("DDR","01",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("USSR","02",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Czechoslovakia","03",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Yugoslavia","04",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("East Timor","05",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Serbia and Montenegro","06",as.character(ESS2014$CountryCode))
ESS2014$CountryCode<-gsub("Alien's passport","65",as.character(ESS2014$CountryCode))



#OLD
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

	
#Creating the "Immigrant" Dataframe"
#subset dataframe based on immigrant status, using answers that are not definitively Yes
#AKA "Born in Country" = "No", "Refusal", "Don't Know","No Answer"
ESS2014.immigrant <- subset(ESS2014,ESS2014$brncntr == "No")
ESS2014.bic <- subset(ESS2014,ESS2014$brncntr == "Yes")

########################
#Aggregating Regional Immigrant Data

#Final Dataframe for Regional Immigrant Data
ESS2014.ImmRegDat <- ESS2014.immigrant %>%
  #Selecting only Country, Birth Country (Full Birth Country Name), and CountryCode (Codes of Birth Country)
  select(cntry,cntbrthc,CountryCode) %>% 
  #Mutate variables based on regional categories
  #Ex: ifelse(CountryCode is in EU),Categorize it as Europe, else "non")
  mutate(Europe = if_else(CountryCode %in% c('XK','IM','AX','AD','AL','AT','BA','BE','BG','BY','CH','03','CZ','DE','DK','EE','ES','FI','FO','FR','GB','GE','GI','GR','HR','HU','IE','IS','IT','LI','LK','LT','LU','LV','MC','MD','MK','MT','NL','NO','PL','PT','RO','RU','RS','SE','SI','SJ','SK','SM','02','UA','VA','04','ME','06'),"Europe","0"),
         Africa = if_else(CountryCode %in% c('AO','BF','BI','BJ','BW','CD','CF','CG','CI','CM','CV','DJ','DZ','EH','ER','ET','GA','GH','GM','GN','GQ','GW','KE','KM','LR','LS','LY','MA','MG','ML','MR','MU','MW','MZ','NA','NE','NG','RE','RW','SC','SD','SH','SL','SN','SO','ST','SZ','TD','TG','TN','TZ','UG','YT','ZA','ZM','ZW','NEia','GN-Bissau'),"Africa","0"),
         SouthAmerica = ifelse(CountryCode %in% c('AR','BO','BR','BZ','CL','CO','EC','FK','GF','GY','PE','PY','SR','UY','VE'),'SouthAmerica','0'),
         Asia = ifelse(CountryCode %in% c('TL','AF','AM','AZ','BD','BN','BT','CC','CN','CX','HK','ID','IN','IO','JP','KG','KH','KP','KR','KZ','LA','MM','MN','MO','MY','NP','PH','PK','SG','TH','TJ','TM','05','TW','UZ','VN'),'Asia','0'),
         Oceania = ifelse(CountryCode %in% c('AS','AU','CK','FJ','FM','GU','KI','MH','MP','NC','NF','NR','NU','NZ','PF','PG','PN','PW','SB','TK','TO','TV','UM','VU','WF','WS'),"Oceania","0"),
         Carribean = ifelse(CountryCode %in% c('AG','AI','AN','AW','BB','BM','BS','CU','CW','BQ','DM','DO','GD','GP','HT','JM','KN','KY','LC','MQ','MS','TC','TT','VC','VG','VI','DMn Republic'),"Carribean","0"),
         NorthAmerica = ifelse(CountryCode %in% c('CA','CR','GL','GT','HN','MX','PM','NI','PA','PM','PR','SV','US'),"NorthAmerica","0"),
         Antarctica = ifelse(CountryCode %in% c('AQ','BV','GS','HM','TF'),"Antarctica","0"),
         NoAnswer = ifelse(CountryCode %in% c('66','77','88','99'),"NoAnswer","0"),
         MiddleEast = ifelse(CountryCode %in% c('BH','CY','EG','IR','IQ','IL','JO','KW','LB','OM','PS','QA','SA','SY','TR','AE','Yemen'),"MiddleEast","0"))%>%  
  #group by Country, and Regional Data to Make regional columns appear
  group_by(cntry,Europe,Africa,SouthAmerica,Asia,Oceania,Carribean,NorthAmerica,Antarctica,NoAnswer,MiddleEast) %>%
  #summarise is basically acting as count() here
  summarise(n=n()) %>%
  #pivot table wide
  pivot_wider(names_from = c("Europe","Africa","SouthAmerica","Asia","Oceania","Carribean","NorthAmerica","Antarctica","NoAnswer","MiddleEast"), #creating columns for all response options in country of birth
              values_from = "n") %>%
  #Clean up variable names
  rename("Country" = "cntry",
         "Europe" = "Europe_0_0_0_0_0_0_0_0_0", #renaming variables
         "Africa" = "0_Africa_0_0_0_0_0_0_0_0",
         "Asia" = "0_0_0_Asia_0_0_0_0_0_0",
         "No Answer" = "0_0_0_0_0_0_0_0_NoAnswer_0",
         "North America" = "0_0_0_0_0_0_NorthAmerica_0_0_0",
         "South America" = "0_0_SouthAmerica_0_0_0_0_0_0_0",
         "Carribean" = "0_0_0_0_0_Carribean_0_0_0_0",
         "Oceania" = "0_0_0_0_Oceania_0_0_0_0_0",
         "Middle East" = "0_0_0_0_0_0_0_0_0_MiddleEast")

#Change NA's to 0
ESS2014.ImmRegDat[is.na(ESS2014.ImmRegDat)] <- 0

####################
#Mother and Father
#Create ESS2014.2G (second_gen) dataset, to record country status of both parents
ESS2014.2G <- ESS2014 %>%
  unite("FM", c('facntr','mocntr'))

#Record Instances where neither parent is definitively born out of the country
#facntr/mocntr asks "Was your Father/Mother born in [country]?"
ESS2014.2G$FM <- gsub("Yes_Yes", 0, as.character(ESS2014.2G$FM))

##Extra Code depending on how we classify "Don't Know's/Refusals/No Answers"
#ESS2014.2G$FM <- gsub("No_Don't know", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No_Refusal", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No_No answer", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Don't know_No", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Don't know_Don't know", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Don't know_Refusal", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Don't know_No answer", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Refusal_No", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Refusal_Don't know", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Refusal_Refusal", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("Refusal_No answer", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No answer_No", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No answer_Don't know", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No answer_Refusal", 0, as.character(ESS2014.2G$FM))
#ESS2014.2G$FM <- gsub("No answer_No answer", 0, as.character(ESS2014.2G$FM))

#Create Second_Gen Variable to easily group based on FM variable
#Second_Gen records if FM Variable is NOT a Yes_Yes, or definitive answer that both parents were born in country
ESS2014.2G$Second_Gen <- ESS2014.2G$FM != 0

#Final Dataframe
ESS2014.2G.final <- ESS2014.2G %>% #convert to data frame
  select(cntry,FM,Second_Gen) %>% 
  group_by(cntry) %>%
  count(Second_Gen) %>%
  #Choose Second_Gen == TRUE, or instances where both parents are not definitively born in country
  filter(Second_Gen == TRUE) %>%
  rename("Country" = "cntry",
         "Second Gen Immigrants" = "n")

#Rearrange Order
ESS2014.2G.final <- ESS2014.2G.final[,c(1,3,2)]

####################
#Miscellaneous Numbers

#total recorded answers
ESS2014.total <- ESS2014 %>%
  select(cntry) %>%
  group_by(cntry) %>%
  count(cntry)%>%
  rename("Country" = "cntry",
         "Total Responses" = "n")

#immigrants
ESS2014.total.imm <- ESS2014.immigrant %>%
  select(cntry) %>%
  group_by(cntry) %>%
  count(cntry)%>%
  rename("Country" = "cntry",
         "Total Immigrants" = "n")

#Born in Country
ESS2014.total.bic <- ESS2014.bic %>%
  select(cntry) %>%
  group_by(cntry) %>%
  count(cntry)%>%
  rename("Country" = "cntry",
         "Total Non-Immigrants" = "n")

#List of Countries
ESS2014.totcntr <- ESS2014.immigrant %>% #convert to data frame
  select(cntry, cntbrthc) %>% #selecting the country and country of birth variables
  group_by(cntry) %>% #grouping by country
  count(cntbrthc) %>% #counting country of birth responses
  pivot_wider(names_from = "cntbrthc", #creating columns for each country of birth response
              values_from = "n") %>% #values for the new colums from the country of birth count
  rename("Country" = "cntry")

#change NA's to 0
ESS2014.totcntr[is.na(ESS2014.totcntr)] <- 0
ESS2014.totcntr <- ESS2014.totcntr[,c(1:4,6:49,51:112,114:166,168:174)]



##Aggregating into one dataset for export into .csv
#Combine Total.bornincountry and Total.Immigrants
newdata1 <- full_join(ESS2014.total.bic, ESS2014.total.imm, by = c("Country"))
#Combine newformed dataset with total observations
newdata2 <- full_join(newdata1, ESS2014.total,by = c("Country"))
newdata3 <- full_join (newdata2,ESS2014.2G.final,by = c("Country"))
newdata4 <- full_join (newdata3, ESS2014.ImmRegDat, by = c("Country"))
newdata4 <- newdata4[,c(1,4,2,3,5,8,9,14,7,11,12,13,15,10)]


#final dataset
ESS2014.Final <- full_join(newdata4,ESS2014.totcntr,by = c("Country"))
#reorder for better clarity
#Export into CSV
write.csv(ESS2014.Final,"ESS2014Final.csv", row.names = FALSE)










