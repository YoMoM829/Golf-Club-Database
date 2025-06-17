/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pat-insert.sql

--Student ID: 33156905
--Student Name: Anand

/* Comments for your marker:




*/

--------------------------------------
-- INSERT INTO official
--------------------------------------

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    1,
    'John',
    'Doe',
    'USA',
    111
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    2,
    'Jane',
    'Smith',
    'CAN',
    112
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    3,
    'Alex',
    'Brown',
    'AUS',
    113
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    4,
    'Emily',
    'Davis',
    'FRA',
    114
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    5,
    'Michael',
    'Miller',
    'GER',
    115
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    6,
    'Lily',
    'White',
    'GBR',
    116
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    7,
    'Robert',
    'Taylor',
    'JPN',
    117
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    8,
    'Sophia',
    'Wilson',
    'ITA',
    118
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    9,
    'Oliver',
    'Johnson',
    'BRA',
    119
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    10,
    'Isabella',
    'Martinez',
    'ESP',
    120
);

COMMIT;

-- --------------------------------------
-- -- INSERT INTO vehicle
-- --------------------------------------

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123459',
    'XYZ1234',
    TO_DATE('2020', 'YYYY'),
    25000,
    5,
    1
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123450',
    'ABC2345',
    TO_DATE('2019', 'YYYY'),
    32000,
    8,
    2
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123452',
    'DEF3456',
    TO_DATE('2018', 'YYYY'),
    40000,
    12,
    3
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123453',
    'GHI4567',
    TO_DATE('2021', 'YYYY'),
    15000,
    5,
    4
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123454',
    'JKL5678',
    TO_DATE('2017', 'YYYY'),
    45000,
    5,
    5
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123455',
    'MNO6789',
    TO_DATE('2023', 'YYYY'),
    28000,
    7,
    1
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123456',
    'PQR7890',
    TO_DATE('2019', 'YYYY'),
    35000,
    6,
    2
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123457',
    'STU8901',
    TO_DATE('2018', 'YYYY'),
    42000,
    8,
    3
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123458',
    'VWX9012',
    TO_DATE('2021', 'YYYY'),
    10000,
    5,
    4
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1HGCM82633A123451',
    'YZA0123',
    TO_DATE('2022', 'YYYY'),
    5000,
    4,
    5
);

COMMIT;

--------------------------------------
-- INSERT INTO trip
--------------------------------------

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    1,
    5,
    TO_DATE('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123459',
    2001,
    101,
    102,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2001),
    1
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    2,
    8,
    TO_DATE('2024-07-22 09:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123450',
    2002,
    102,
    103,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2002),
    2
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    3,
    12,
    TO_DATE('2024-07-27 08:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-28 16:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123452',
    2003,
    103,
    104,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2003),
    3
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    4,
    5,
    TO_DATE('2024-08-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-02 18:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123453',
    2004,
    104,
    105,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2001),
    4
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    5,
    7,
    TO_DATE('2024-08-02 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-03 13:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123454',
    2005,
    105,
    106,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2005),
    5
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    6,
    6,
    TO_DATE('2024-07-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-23 14:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123455',
    2006,
    106,
    107,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2006),
    1
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    7,
    9,
    TO_DATE('2024-07-25 07:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-26 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123456',
    2007,
    107,
    108,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2007),
    2
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    8,
    10,
    TO_DATE('2024-07-29 10:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-30 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123457',
    2008,
    108,
    109,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2008),
    3
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    9,
    5,
    TO_DATE('2024-08-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123458',
    2009,
    109,
    110,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2009),
    4
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    10,
    8,
    TO_DATE('2024-08-04 13:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-05 17:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123459',
    2010,
    110,
    111,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2010),
    5
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    11,
    4,
    TO_DATE('2024-08-06 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123450',
    2003,
    111,
    112,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2003),
    1
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    12,
    3,
    TO_DATE('2024-08-08 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-09 16:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123451',
    2005,
    112,
    113,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2005),
    2
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    13,
    11,
    TO_DATE('2024-08-09 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123452',
    2008,
    113,
    114,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2008),
    3
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    14,
    6,
    TO_DATE('2024-08-11 07:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-08-12 19:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123455',
    2011,
    114,
    115,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2011),
    4
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    15,
    7,
    TO_DATE('2024-07-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-21 16:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123457',
    2004,
    115,
    116,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2004),
    1
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    16,
    9,
    TO_DATE('2024-07-22 08:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-23 17:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123458',
    2007,
    116,
    117,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2007),
    2
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    17,
    4,
    TO_DATE('2024-07-24 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123459',
    2012,
    117,
    118,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2012),
    3
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    18,
    5,
    TO_DATE('2024-07-26 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-27 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123450',
    2002,
    118,
    119,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2002),
    4
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    19,
    6,
    TO_DATE('2024-07-28 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-29 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123451',
    2014,
    119,
    120,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2014),
    5
);

INSERT INTO trip (
    trip_id,
    trip_nopassenegers,
    trip_int_pickupdt,
    trip_act_pickupdt,
    trip_int_dropoffdt,
    trip_act_dropoffdt,
    veh_vin,
    driver_id,
    pickup_locn_id,
    dropoff_locn_id,
    lang_iso_code,
    off_id
) VALUES (
    20,
    8,
    TO_DATE('2024-07-30 13:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    TO_DATE('2024-07-31 19:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    NULL,
    '1HGCM82633A123460',
    2009,
    120,
    121,
    (select max(LANG_ISO_CODE) from DRIVER_LANGUAGE where DRIVER_ID = 2009),
    6
);

commit;