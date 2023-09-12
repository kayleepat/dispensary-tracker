# dispensary-tracker

## Overview
This is an ETL (Extract, Transform, Load) project consisting of three major parts. 

In the extraction phase, we scrape data from the [Office of Medical Marijuana Use Website](https://knowthefactsmmj.com/mmtc/) to gather a list of all Medical Marijuana Treatment Centers.

In the transformation phase, we created pandas dataframes containing the information we gathered from the webscraper. We clean up the information, and created a new column to hold the full address of each dispensary. Using this new address column, we can find the coordinates of each dispensary by using the [Geoapify Geocoding API](https://www.geoapify.com/). After gathering this information, the program will use the data to search for any nearby competition for any FLUENT dispensaries within Florida. This list of competitors is then saved in another dataframe.

Finally, all of this information is loaded into a SQL database. This database contains several tables with the information for all dispensaries and FLUENT competitors.

Due to the method of data collection, the list of competitors will update with any new stores any time the program is ran.

## Usage
This project contains several files that all contribute to the ETL process.

### mmtc_scrape.ipynb
This is the webscraper. It will search for all Medical Marijuana Treatment Centers and save all of their information.

### geolocate_and_competitor_count.ipynb
This file will automatically run the webscraper and import all data gathered. It then uses the Geoapify API to find and save the coordinates for each listed dispensary. Using this information, it then calculates the distance between each FLUENT store and all other potential competitors. If any other store is within a given radius, it will be saved in the list of competitors.

### database_erd.sql
This file sets up the SQL schema.

## Dependencies
This project is ran through python and relies on several libraries:
- Splinter
- Beautiful Soup
- Pandas
- Numpy
- Geopy
- ipynb

## Resources
- [Office of Medical Marijuana Use Website](https://knowthefactsmmj.com/mmtc/)
- [Geoapify Geocoding API](https://www.geoapify.com/)
