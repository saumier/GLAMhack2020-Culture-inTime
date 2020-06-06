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
The intention of this project was to two-fold:
-Provide a robust listing of arts and cultural events, both historical and current. Audiences are able to search for things they are interested in, learn more about performing arts productions and events, find new interests, et cetera.
- Reduce duplication of work in area of data entry


The code is a simple as possible to demonstrate the potential of using LOD (structured data) to create a calendar for arts and cultural events that is generated from data in Wikidata and the Artsdata.ca knowledge graph. 

The user interface is designed to allow visitors to search for events. They can:
- Use the Spotlight feature to quickly view events based on the following search criteria: name of city and predetermined date range.
- Use Time Period buttons to search a time period (international).
- Use a Search field to enter a search using the following criteria: name of production, city and country.
- Select an image from a gallery to find related information.
- Visit the source of the data to learn more (in the example of an Artsdata.ca event, Click Visit Source to be redirected to the Art Organization website.

Note: Currently when you enter a location, data only exists for Switzerland and Canada (country), Zurich or Montreal/Laval (city)  

Search results list events sorted by date, title and location.


Challenges
=========================
Data is modelled differently in Wikidata, Artsdata, and even between projects within the same database.
Data has very few images.

UI Images
=========================
![Alt text](/relative/path/to/HomePage.png "Home Page")
