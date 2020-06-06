GLAMhack 2020 - Culture inTime
=========================
Simple event calendar for public viewing that written in Rails, SParQl and Semantic UI (web interface platform). Using existing linked open data (LOD) on productions & events, locations & venues, and dates to feed contemporary and historical data into this calendar. Coming soon: LOD on artists and works. 

Find information on this project in Glamhack Wiki and here.

Go to https://culture-intime.herokuapp.com/ and view calendar

Data Sources
=========================
Building on dataset already integrated into Wikidata: data from Schauspielehaus, Zurich. For reference see: https://www.wikidata.org/wiki/Wikidata:WikiProject_Performing_arts/Reports/Ingesting_Production_Databases_of_the_Performing_Arts
Using data from Artsdata.ca: pan-Canadian knowledge graph for the performing arts 


Background
=========================
The intention of this project was to twofold:
-reduce duplication of work in area of data entry
-

The code is a simple as possible to demonstrate the potential of using LOD (structured data) to create a calendar for arts and cultural events that is generated from data in Wikidata and the Artsdata.ca knowledge graph. 

The user interface is designed to allow visitors to search for events. They can:
- Select a time period
- Select an image from a gallery to find related events
- Enter a location (currently, data only exists for Switzerland and Canada (country), Zurich or Montreal/Laval (city)  
- Enter name of production
- Type of production (WD: instance of…)
- Title (free text search)

Search results list events sorted by date, title and location.


Challenges: 
Data is modelled differently in Wikidata, Artsdata, and even between projects within the same database.
Data has very few images.

