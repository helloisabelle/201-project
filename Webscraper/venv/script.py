import requests
import bs4
import json
# import pymongo
# from pymongo import MongoClient


class Event:
    def __init__(self, title, date, time, location, description):
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.description = description


def write_to_json_file (path, filename, data):
    file_path_name_w_ext = "./" + path + '/' + filename + ".json"
    with open(file_path_name_w_ext, 'w') as fp:
        json.dump(data, fp)
        


result = requests.get("https://calendar.usc.edu/calendar/week?event_types%5B%5D=43451")

soup = bs4.BeautifulSoup(result.text, 'lxml')

allFreeEvents = soup.findAll("div", {"class": "item_content_medium"})

eventObjects = []

for x in allFreeEvents:

    # Find title
    child = x.findChildren("h3", {"class": "summary"})
    titleUnrefined = child[0].findChildren("a", recursive=True)
    title = ' '.join(titleUnrefined[0].text.split())
    # print(titleUnrefined[0].text)

    #find date
    parent = x.find_parent("div", {"class": "item event_item vevent"})
    dateUnrefined = parent.find_previous_sibling("div", {"class": "box_title_small date_divider"})
    date = ' '.join(dateUnrefined.text.split())
    # print(dateUnrefined.text)

    #find location
    child = x.findChildren("div", {"class": "location"})
    location = ' '.join(child[0].text.split())

    # location = location.substring(location.indexOf("(") + 1);
    # location.
    location = location[location.find("(")+1 : location.find(")")]
    # location = location.substring(0, location.indexOf(")"));
    # print(child[0].text)

    #find time
    child = x.findChildren("div", {"class": "dateright"})
    time = ' '.join(child[0].text.split())
    # print(time)

    #find description
    child = x.findChildren("h4", {"class": "description"})
    description = ' '.join(child[0].text.split())
    # print(description)

    event = Event(title, date, time, location, description)
    eventObjects.append(event)

path = './'
filename = 'data'
data = []

for x in eventObjects:

    data.append({
        'title': x.title,
        'date': x.date,
        'time': x.time,
        'location': x.location,
        'description': x.description
    })
    print(x.title)
    # data.update(y)

write_to_json_file(path, filename, data)






