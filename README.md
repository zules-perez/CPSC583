# CPSC583
## Expert Systems Design Theory

### Simple WoW Battle Pet Expert System using CLIPS Rule

![image](https://user-images.githubusercontent.com/22207108/197358636-de539746-cc9e-45fe-a78b-ce85c7967217.png)

Data was collected from Blizzard API specifically the World of Warcraft Pet API endpoints.

Created a program in Python in order to pull the data from the API.
Used MongoDB to dump all data collected from the WoW API.
Extracted and transformed data using a Python program I created for data transformation.
Once data was transformed and formated it was loaded into CLIPS Rule IDE.

A simple expert system was created in CLIPS using 326 battle pets out of the 1522 battle pets available for performance reasons.

The expert system requires the user to answer a few questions in order for the expert system to provide a recommendation.

The user can choose from three choices from a menu asking if they would like to search for Battle Pets by
Battle Type, Strong Against, and Weak Against.

Then the user is asked what is the Pet Quality they desire.
Lastly, the user is asked what os the Pet Faction.
Answering all the questions, the user recieves Battle Pet recommendations.

If no recommondations are found only the print header bar will appear with no other information.
