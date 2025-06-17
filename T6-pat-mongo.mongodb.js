// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-pat-mongo.mongodb.js

// Student ID: 33156905
// Student Name: Anand Vannalath

//Comments for your marker:

// ===================================================================================
// Do not add new comments to this playground
// OR modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("avan0055");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.trip.drop()

// // Create collection and insert documents
db.trip.insertMany([
  {
    "_id": 2001,
    "name": "Pierre Martin",
    "licence_num": "120501123456",
    "no_of_trips": 1,
    "suspended": "Y",
    "trips_info": [
      {
        "trip_id": 1,
        "veh_vin": "1HGCM82633A123459",
        "pick-up": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "2024-07-21T10:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "2024-07-22T15:30:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2002,
    "name": "Marie Dupont",
    "licence_num": "34082A789012",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 18,
        "veh_vin": "1HGCM82633A123450",
        "pick-up": {
          "location_id": 118,
          "location_name": "Sainte-Chapelle",
          "intended_datetime": "2024-07-26T10:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 119,
          "location_name": "Arc de Triomphe",
          "intended_datetime": "2024-07-27T15:00:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2003,
    "name": "Louis Dubois",
    "licence_num": "45112B654321",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 3,
        "veh_vin": "1HGCM82633A123452",
        "pick-up": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "2024-07-27T08:15:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "2024-07-28T16:45:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 11,
        "veh_vin": "1HGCM82633A123450",
        "pick-up": {
          "location_id": 111,
          "location_name": "Porte de La Chapelle Arena",
          "intended_datetime": "2024-08-06T09:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 112,
          "location_name": "Roland Garros Stadium",
          "intended_datetime": "2024-08-07T17:00:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2004,
    "name": "Antoine Lefevre",
    "licence_num": "670495098765",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 4,
        "veh_vin": "1HGCM82633A123453",
        "pick-up": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "2024-08-01T14:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 105,
          "location_name": "South Paris Arena",
          "intended_datetime": "2024-08-02T18:30:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 15,
        "veh_vin": "1HGCM82633A123457",
        "pick-up": {
          "location_id": 115,
          "location_name": "Eiffel Tower",
          "intended_datetime": "2024-07-20T09:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 116,
          "location_name": "Louvre Museum",
          "intended_datetime": "2024-07-21T16:30:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2005,
    "name": "Sophie Bernard",
    "licence_num": "89122a345678",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 5,
        "veh_vin": "1HGCM82633A123454",
        "pick-up": {
          "location_id": 105,
          "location_name": "South Paris Arena",
          "intended_datetime": "2024-08-02T11:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 106,
          "location_name": "La Beaujoire Stadium",
          "intended_datetime": "2024-08-03T13:45:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 12,
        "veh_vin": "1HGCM82633A123451",
        "pick-up": {
          "location_id": 112,
          "location_name": "Roland Garros Stadium",
          "intended_datetime": "2024-08-08T10:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 113,
          "location_name": "Olympic and Paralympic village",
          "intended_datetime": "2024-08-09T16:45:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2006,
    "name": "Arman ",
    "licence_num": "23072b567890",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 6,
        "veh_vin": "1HGCM82633A123455",
        "pick-up": {
          "location_id": 106,
          "location_name": "La Beaujoire Stadium",
          "intended_datetime": "2024-07-22T12:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 107,
          "location_name": "North Paris Arena",
          "intended_datetime": "2024-07-23T14:15:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2007,
    "name": "Jean Moreau",
    "licence_num": "560903234567",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 7,
        "veh_vin": "1HGCM82633A123456",
        "pick-up": {
          "location_id": 107,
          "location_name": "North Paris Arena",
          "intended_datetime": "2024-07-25T07:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 108,
          "location_name": "Parc des Princes",
          "intended_datetime": "2024-07-26T19:00:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 16,
        "veh_vin": "1HGCM82633A123458",
        "pick-up": {
          "location_id": 116,
          "location_name": "Louvre Museum",
          "intended_datetime": "2024-07-22T08:45:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 117,
          "location_name": "Tuileries Garden",
          "intended_datetime": "2024-07-23T17:15:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2008,
    "name": "Isabelle Fournier",
    "licence_num": "780350987654",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 8,
        "veh_vin": "1HGCM82633A123457",
        "pick-up": {
          "location_id": 108,
          "location_name": "Parc des Princes",
          "intended_datetime": "2024-07-29T10:15:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "2024-07-30T14:45:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 13,
        "veh_vin": "1HGCM82633A123452",
        "pick-up": {
          "location_id": 113,
          "location_name": "Olympic and Paralympic village",
          "intended_datetime": "2024-08-09T08:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 114,
          "location_name": "Champions Park",
          "intended_datetime": "2024-08-10T18:00:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2009,
    "name": "Emilie Michel",
    "licence_num": "900115876543",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 9,
        "veh_vin": "1HGCM82633A123458",
        "pick-up": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "2024-08-01T09:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 110,
          "location_name": "Pierre Mauroy Stadium",
          "intended_datetime": "2024-08-02T16:00:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 20,
        "veh_vin": "1HGCM82633A123460",
        "pick-up": {
          "location_id": 120,
          "location_name": "The Basilica of the Sacred Heart of Paris",
          "intended_datetime": "2024-07-30T13:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 121,
          "location_name": "Saint-Quentin-en-Yvelines Velodrome",
          "intended_datetime": "2024-07-31T19:30:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2010,
    "name": "Naoki Fujimoto",
    "licence_num": "110685765432",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 10,
        "veh_vin": "1HGCM82633A123459",
        "pick-up": {
          "location_id": 110,
          "location_name": "Pierre Mauroy Stadium",
          "intended_datetime": "2024-08-04T13:15:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 111,
          "location_name": "Porte de La Chapelle Arena",
          "intended_datetime": "2024-08-05T17:30:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2011,
    "name": "Mathieu Girard",
    "licence_num": "22102A456789",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 14,
        "veh_vin": "1HGCM82633A123455",
        "pick-up": {
          "location_id": 114,
          "location_name": "Champions Park",
          "intended_datetime": "2024-08-11T07:15:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 115,
          "location_name": "Eiffel Tower",
          "intended_datetime": "2024-08-12T19:30:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2012,
    "name": " Mansour",
    "licence_num": "33022B678901",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 17,
        "veh_vin": "1HGCM82633A123459",
        "pick-up": {
          "location_id": 117,
          "location_name": "Tuileries Garden",
          "intended_datetime": "2024-07-24T09:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 118,
          "location_name": "Sainte-Chapelle",
          "intended_datetime": "2024-07-25T18:00:00",
          "actual_datetime": null
        }
      }
    ]
  },
  {
    "_id": 2014,
    "name": "Claire Robert",
    "licence_num": "55052a543210",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 19,
        "veh_vin": "1HGCM82633A123451",
        "pick-up": {
          "location_id": 119,
          "location_name": "Arc de Triomphe",
          "intended_datetime": "2024-07-28T11:00:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 120,
          "location_name": "The Basilica of the Sacred Heart of Paris",
          "intended_datetime": "2024-07-29T14:00:00",
          "actual_datetime": null
        }
      },
      {
        "trip_id": 100,
        "veh_vin": "1C4SDHCT9FC614231",
        "pick-up": {
          "location_id": 113,
          "location_name": "Olympic and Paralympic village",
          "intended_datetime": "2024-06-30T12:30:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 111,
          "location_name": "Porte de La Chapelle Arena",
          "intended_datetime": "2024-06-30T14:15:00",
          "actual_datetime": null
        }
      }
    ]
  }
])

// // List all documents you added
db.trip.find(
    {"_id": 2012}
);

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.trip.find(
  { "trips_info.drop off.location_name": { "$in": ["Champions Park", "Porte de La Chapelle Arena"] } },
  { "_id": 1, "name": 1 }
);


// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Show document before the new trip is added and the driver is suspended
db.trip.find(
    { _id: 2004 },
    {
        name: 1,
        licence_num: 1,
        no_of_trips: 1,
        suspended: 1,
        trips_info: 1
    }
)

// Add new trip and set the driver to suspended
db.trip.updateOne(
    { _id: 2004 },
    {
        $push: {
            trips_info: {
                trip_id: 22,  // Made-up trip_id, should be unique
                veh_vin: "2A8HW54P69R614832", // Sample VIN
                "pick_up": {
                  location_id: 117,
                  location_name: "Tuileries Garden",
                  intended_datetime: "2024-08-10T09:00:00", //T is used to signify the time
                  actual_datetime: "2024-08-10T09:05:00"
                },
                "drop off": {
                    location_id: 118,
                    location_name: "Sainte-Chapelle",
                    intended_datetime: "2024-08-10T09:30:00",
                    actual_datetime: "2024-08-10T09:35:00"
                }
            }
        },
        $set: { suspended: "Y" },
        $inc: { no_of_trips: 1 }
    }
)

// Illustrate/confirm changes made
db.trip.find(
    { _id: 2004 },
    {
        name: 1,
        licence_num: 1,
        no_of_trips: 1,
        suspended: 1,
        trips_info: 1
    }
);