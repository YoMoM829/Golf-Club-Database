/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pat-json.sql

--Student ID: 33156905 
--Student Name: Anand Vannalath


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT JSON_OBJECT(
    '_id' VALUE d.driver_id,
    'name' VALUE d.DRIVER_GIVEN || ' ' || d.DRIVER_FAMILY,
    'licence_num' VALUE d.DRIVER_LICENCE,
    'no_of_trips' VALUE COUNT(t.trip_id),
    'suspended' VALUE d.DRIVER_SUSPENDED,
    'trips_info' VALUE JSON_ARRAYAGG(
        JSON_OBJECT(
            'trip_id' VALUE t.trip_id,
            'veh_vin' VALUE t.veh_vin,
            'pick_up' VALUE JSON_OBJECT(
                'location_id' VALUE t.PICKUP_LOCN_ID,
                'location_name' VALUE p.LOCN_NAME,
                'intended_datetime' VALUE TO_CHAR(t.TRIP_INT_PICKUPDT, 'YYYY-MM-DD-HH24:MI:SS'),
                'actual_datetime' VALUE TO_CHAR(t.TRIP_ACT_PICKUPDT, 'YYYY-MM-DD-HH24:MI:SS')
            ) FORMAT JSON,
            'drop off' VALUE JSON_OBJECT(
                'location_id' VALUE t.DROPOFF_LOCN_ID,
                'location_name' VALUE d.LOCN_NAME,
                'intended_datetime' VALUE TO_CHAR(t.TRIP_INT_DROPOFFDT, 'YYYY-MM-DD-HH24:MI:SS'),
                'actual_datetime' VALUE TO_CHAR(t.TRIP_ACT_DROPOFFDT, 'YYYY-MM-DD-HH24:MI:SS')
            ) FORMAT JSON
        ) FORMAT JSON
        ORDER BY t.trip_id
    ) FORMAT JSON
)
||
','
FROM driver d 
JOIN trip t ON d.DRIVER_ID = t.DRIVER_ID
JOIN location p ON t.PICKUP_LOCN_ID = p.LOCN_ID
JOIN location d ON t.DROPOFF_LOCN_ID = d.LOCN_ID
GROUP BY d.driver_id, d.DRIVER_GIVEN || ' ' || d.DRIVER_FAMILY, d.DRIVER_LICENCE, d.DRIVER_SUSPENDED
ORDER BY d.driver_id;

commit;