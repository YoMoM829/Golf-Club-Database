/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pat-dml.sql

--Student ID: 33156905
--Student Name: Anand Vannalath

/* Comments for your marker:




*/

/*(a)*/
DROP SEQUENCE official_pk_seq;

DROP SEQUENCE trip_pk_seq;

CREATE SEQUENCE official_pk_seq
START WITH 100 INCREMENT BY 10;

CREATE SEQUENCE trip_pk_seq
START WITH 100 INCREMENT BY 10;

commit;

/*(b)*/
-- Inserting Franklin Gateau
INSERT INTO official VALUES (
    official_pk_seq.NEXTVAL,
    'Franklin',
    'Gateau',
    (SELECT cr_ioc_code FROM country_region WHERE lower(cr_name) = lower( 'St Vincent and the Grenadines' )),
    121
);

-- Inserting the new Vehcile
INSERT INTO vehicle VALUES (
    '1C4SDHCT9FC614231',
    'FIT3171',
    TO_DATE('2016-04-08', 'YYYY-MM-DD'),
    50000,
    6,
    (SELECT vm_model_id FROM vehicle_model WHERE upper(vm_model) = upper('Alphard'))
);

COMMIT;

/*(c)*/

-- Inserting new trip
INSERT INTO trip VALUES (
    trip_pk_seq.NEXTVAL,
    (SELECT veh_nopassengers FROM vehicle WHERE veh_vin = '1C4SDHCT9FC614231') - 2,
    TO_DATE('2024-06-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-06-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1C4SDHCT9FC614231',
    (SELECT driver_id FROM driver WHERE driver_licence = '55052a543210'),
    (SELECT locn_id FROM location WHERE upper(locn_name) = upper('Olympic and Paralympic Village')),
    (SELECT locn_id FROM location WHERE upper(locn_name) = upper('Porte de la Chapelle Arena')),
    (SELECT lang_iso_code FROM language WHERE upper(lang_name) = upper('English')),
    (SELECT off_id FROM official WHERE upper(off_given) = upper('Franklin') AND upper(off_family) = upper('Gateau'))
);

-- Inserting new trip
INSERT INTO trip VALUES (
    trip_pk_seq.NEXTVAL,
    (SELECT veh_nopassengers FROM vehicle WHERE veh_vin = '1C4SDHCT9FC614231') - 2,
    TO_DATE('2024-06-30 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-06-30 21:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1C4SDHCT9FC614231',
    (SELECT driver_id FROM driver WHERE driver_licence = '55052a543210'),
    (SELECT locn_id FROM location WHERE upper(locn_name) = upper('Porte de la Chapelle Arena')),
    (SELECT locn_id FROM location WHERE upper(locn_name) = upper('Olympic and Paralympic Village')),
    (SELECT lang_iso_code FROM language WHERE upper(lang_name) = upper('English')),
    (SELECT off_id FROM official WHERE upper(off_given) = upper('Franklin') AND upper(off_family) = upper('Gateau'))
);

COMMIT;

/*(d)*/

-- Updates trip time
UPDATE trip
SET
    trip_int_dropoffdt = TO_DATE(
        '2024-06-30 14:15:00',
        'YYYY-MM-DD HH24:MI:SS'
    )
WHERE
    trip_int_dropoffdt = TO_DATE('2024-06-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- Deletes trip's after Claire's accident on the day
DELETE FROM trip
WHERE
    trip_int_pickupdt > TO_DATE('2024-06-30 17:00:00', 'YYYY-MM-DD HH24:MI:SS')
    AND trip_int_pickupdt < TO_DATE('2024-06-30 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
    and driver_id = (SELECT driver_id FROM driver WHERE driver_licence = '55052a543210');

COMMIT;