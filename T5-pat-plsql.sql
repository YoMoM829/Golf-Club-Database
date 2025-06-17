--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-pat-plsql.sql

--Student ID: 33156905
--Student Name: Anand Vannalath

/* Comments for your marker:


*/

--(a)
-- Write your trigger statement,
-- finish it with a slash(/) followed by a blank line
ALTER TABLE driver
    ADD driver_demerit_pts NUMERIC(
        1
    ) DEFAULT 0;

COMMENT ON COLUMN driver.driver_demerit_pts IS 'The number of demerit points the driver has';

CREATE OR REPLACE TRIGGER check_driver_demerit_points AFTER
    UPDATE OF comp_valid ON complaint FOR EACH ROW WHEN (new.comp_valid = 'V')
DECLARE
    v_demerit_pts NUMBER(1);
    v_driver_id   NUMBER(4); -- Assuming driver_id is of NUMERIC(4)
BEGIN
 
    -- Get the driver ID associated with the complaint
    SELECT
        driver_id INTO v_driver_id
    FROM
        trip
    WHERE
        trip_id = :new.trip_id;
 
    -- Update driver's demerit points by adding the demerit points for this complaint
    UPDATE driver
    SET
        driver_demerit_pts = driver_demerit_pts + (
            SELECT
                demerit_pts
            FROM
                complaint_category
            WHERE
                comp_category_id = :new.comp_category_id
        )
    WHERE
        driver_id = v_driver_id;
 
    -- Get the updated demerit points for the driver
    SELECT
        driver_demerit_pts INTO v_demerit_pts
    FROM
        driver
    WHERE
        driver_id = v_driver_id;
 
    -- Check if the demerit points are 4 or above
    IF v_demerit_pts >= 4 THEN
        UPDATE driver
        SET
            driver_suspended = 'Y'
        WHERE
            driver_id = v_driver_id; -- Update the driver based on the driver ID
    END IF;
END;
/

-- Write Test Harness for (a)

-- Creating complaints
INSERT INTO complaint (
    comp_id,
    trip_id,
    off_id,
    comp_category_id,
    comp_date_time,
    comp_description
) VALUES (
    1,
    1,
    1,
    1,
    (SELECT trip_int_pickupdt + (10 / (24 * 60)) FROM trip WHERE trip_id = 1), -- Adding 10 minutes
    'The driver was late.'
);

INSERT INTO complaint (
    comp_id,
    trip_id,
    off_id,
    comp_category_id,
    comp_date_time,
    comp_description
) VALUES (
    2,
    1,
    2,
    2,
    (SELECT trip_int_pickupdt + (11 / (24 * 60)) FROM trip WHERE trip_id = 1), -- Adding 11 minutes
    'The driver was extremly rude'
);

-- The demerit points add to 4 so the trigger will be activated
INSERT INTO complaint (
    comp_id,
    trip_id,
    off_id,
    comp_category_id,
    comp_date_time,
    comp_description
) VALUES (
    3,
    1,
    2,
    4,
    (SELECT trip_int_dropoffdt - (1 / (24 * 60)) FROM trip WHERE trip_id = 1), -- Subtracting 1 minute
    'The driver did not assist me with getting out of the car. I am handicapped.'
);

-- Before value
SELECT
    *
FROM
    complaint;

SELECT
    *
FROM
    complaint_category;

SELECT
    driver_id,
    driver_given,
    driver_family,
    driver_demerit_pts,
    driver_suspended
FROM
    driver
WHERE
    driver_id = (
        SELECT
            driver_id
        FROM
            trip
        WHERE
            trip_id = 1
    );

-- Update the complaints to valid

SELECT
    *
FROM
    driver;

UPDATE complaint
SET
    comp_valid = 'V'
WHERE
    comp_id = 1;

SELECT
    *
FROM
    complaint;

UPDATE complaint
SET
    comp_valid = 'V'
WHERE
    comp_id = 2;

UPDATE complaint
SET
    comp_valid = 'V'
WHERE
    comp_id = 3;

-- After value
SELECT
    *
FROM
    complaint;

SELECT
    *
FROM
    complaint_category;

SELECT
    driver_id,
    driver_given,
    driver_family,
    driver_demerit_pts,
    driver_suspended
FROM
    driver
WHERE
    driver_id = (
        SELECT
            driver_id
        FROM
            trip
        WHERE
            trip_id = 1
    );

commit;

--(b)
-- Complete the procedure below
-- finish it with a slash(/) followed by a blank line
CREATE OR REPLACE PROCEDURE prc_insert_trip (
    p_off_id IN NUMBER,
    p_nopassengers IN NUMBER,
    p_int_pickupdt IN DATE,
    p_int_dropoffdt IN DATE,
    p_pickup_locn_name IN VARCHAR2,
    p_dropoff_locn_name IN VARCHAR2,
    p_lang_name IN VARCHAR2,
    p_veh_vin IN CHAR,
    p_driver_id IN NUMBER,
    p_output OUT VARCHAR2
) IS
    v_off_id              NUMBER;
    v_pickup_locn_id      NUMBER;
    v_dropoff_locn_id     NUMBER;
    v_pickup_count        NUMBER;
    v_dropoff_count       NUMBER;
    v_veh_vin_count       NUMBER;
    v_veh_passenger_limit NUMBER;
    v_driver_count        NUMBER;
    v_driver_license      CHAR;
    v_lang_count          NUMBER;
    v_lang_iso_code       CHAR;
    v_trip_id             NUMBER;
    v_trip_found          NUMBER;
BEGIN
 
    -- Validate the number of passengers
    IF p_nopassengers <= 0 THEN
        p_output := 'Invalid number of passengers. Must be greater than zero.';
    ELSE
 
        -- Validate pick-up and drop-off dates
        IF p_int_pickupdt >= p_int_dropoffdt THEN
            p_output := 'Invalid trip dates. Pick-up date must be before drop-off date.';
        ELSE
 
            -- Validate official ID
            SELECT
                count(*) INTO v_off_id
            FROM
                official
            WHERE
                off_id = p_off_id;
            IF v_off_id = 0 THEN
                p_output := 'Invalid official ID, new trip insertion cancelled';
            ELSE
 
                -- Validate location IDs
                SELECT
                    count(*) INTO v_pickup_count
                FROM
                    location
                WHERE
                    upper(locn_name) = upper(p_pickup_locn_name);
                IF v_pickup_count = 0 THEN
                    p_output := 'Invalid pickup location, new trip insertion cancelled';
                ELSE
                    SELECT
                        count(*) INTO v_dropoff_count
                    FROM
                        location
                    WHERE
                        upper(locn_name) = upper(p_dropoff_locn_name);
                    IF v_dropoff_count = 0 THEN
                        p_output := 'Invalid dropoff location, new trip insertion cancelled';
                    ELSE
 
                        -- Validate language
                        SELECT
                            count(*) INTO v_lang_count
                        FROM
                            language
                        WHERE
                            upper(lang_name) = upper(p_lang_name);
                        IF v_lang_count = 0 THEN
                            p_output := 'Invalid language, new trip insertion cancelled';
                        ELSE
 
                            -- Validate vehicle VIN
                            SELECT
                                count(*) INTO v_veh_vin_count
                            FROM
                                vehicle
                            WHERE
                                upper(veh_vin) = upper(p_veh_vin);
                            IF v_veh_vin_count = 0 THEN
                                p_output := 'Invalid vehicle VIN, new trip insertion cancelled';
                            ELSE
 
                                -- Validate driver ID
                                SELECT
                                    count(*) INTO v_driver_count
                                FROM
                                    driver
                                WHERE
                                    driver_id = p_driver_id;
                                IF v_driver_count = 0 THEN
                                    p_output := 'Invalid driver ID, new trip insertion cancelled';
                                ELSE
 
                                    -- Validate driver suspension
                                    SELECT
                                        driver_suspended INTO v_driver_license
                                    FROM
                                        driver
                                    WHERE
                                        driver_id = p_driver_id;
                                    IF v_driver_license = '' THEN
                                        p_output := 'Driver is suspended, new trip insertion cancelled';
                                    ELSE
 
                                        -- Validate vehicle passenger limit
                                        SELECT
                                            veh_nopassengers INTO v_veh_passenger_limit
                                        FROM
                                            vehicle
                                        WHERE
                                            veh_vin = p_veh_vin;
                                        IF v_veh_passenger_limit < p_nopassengers THEN
                                            p_output := 'Exceeded vehicle passenger limit, new trip insertion cancelled';
                                        ELSE
 
                                            -- Retrieve IDs for pickup location, dropoff location, and language code
                                            SELECT
                                                locn_id INTO v_pickup_locn_id
                                            FROM
                                                location
                                            WHERE
                                                upper(locn_name) = upper(p_pickup_locn_name);
                                            SELECT
                                                locn_id INTO v_dropoff_locn_id
                                            FROM
                                                location
                                            WHERE
                                                upper(locn_name) = upper(p_dropoff_locn_name);
                                            SELECT
                                                lang_iso_code INTO v_lang_iso_code
                                            FROM
                                                language
                                            WHERE
                                                upper(lang_name) = upper(p_lang_name);
 
                                            -- Check if trip already exists
                                            SELECT
                                                count(*) INTO v_trip_found
                                            FROM
                                                trip
                                            WHERE
                                                trip_nopassenegers = p_nopassengers
                                                AND trip_int_pickupdt = p_int_pickupdt
                                                AND trip_int_dropoffdt = p_int_dropoffdt
                                                AND veh_vin = p_veh_vin
                                                AND driver_id = p_driver_id
                                                AND pickup_locn_id = v_pickup_locn_id
                                                AND dropoff_locn_id = v_dropoff_locn_id
                                                AND lang_iso_code = v_lang_iso_code;
                                            IF v_trip_found > 0 THEN
                                                p_output := 'Trip already exists in the system';
                                            ELSE
 
                                                -- Generate trip_id using a sequence (replace with your sequence name)
                                                SELECT
                                                    trip_pk_seq.nextval INTO v_trip_id
                                                FROM
                                                    dual;
 
                                                -- Insert the trip record
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
                                                    v_trip_id,
                                                    p_nopassengers,
                                                    p_int_pickupdt,
                                                    NULL,
                                                    p_int_dropoffdt,
                                                    NULL,
                                                    p_veh_vin,
                                                    p_driver_id,
                                                    v_pickup_locn_id,
                                                    v_dropoff_locn_id,
                                                    v_lang_iso_code,
                                                    p_off_id
                                                );
                                                p_output := 'Trip inserted successfully with trip_id: '
                                                            || to_char(v_trip_id);
                                                DBMS_OUTPUT.PUT_LINE(p_output);
                                            END IF;
                                        END IF;
                                    END IF;
                                END IF;
                            END IF;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        p_output := sqlerrm;
END;
/

-- Write Test Harness for (b)

-- Test Case 1: Invalid number of passengers (must be greater than zero)
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, -3, -- Invalid number of passengers
    to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 1 - Invalid number of passengers: '
                         || output);
END;
/

-- Test Case 2: Pick-up date is after drop-off date
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), -- Pickup date is later than drop-off date
    to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'ka', '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 2 - Pickup date after drop-off date: '
                         || output);
END;
/

-- Test Case 3: Invalid official ID (non-existent ID)
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 9999, -- Invalid official ID
    3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 3 - Invalid official ID: '
                         || output);
END;
/

-- Test Case 4: Invalid pickup location
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Unknown Location', -- Invalid pickup location
    'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 4 - Invalid pickup location: '
                         || output);
END;
/

-- Test Case 5: Invalid dropoff location
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'Unknown Location', -- Invalid dropoff location
    'Georgian', '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 5 - Invalid dropoff location: '
                         || output);
END;
/

-- Test Case 6: Invalid language
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'unknown', -- Invalid language
    '1C4SDHCT9FC614231', 2002, output );
    dbms_output.put_line('Test Case 6 - Invalid language: '
                         || output);
END;
/

-- Test Case 7: Invalid vehicle VIN
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', 'INVALIDVIN', -- Invalid vehicle VIN
    2002, output );
    dbms_output.put_line('Test Case 7 - Invalid vehicle VIN: '
                         || output);
END;
/

-- Test Case 8: Invalid driver ID
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 9999, -- Invalid driver ID
    output );
    dbms_output.put_line('Test Case 8 - Invalid driver ID: '
                         || output);
END;
/

-- Test Case 9: Driver is suspended
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2001, -- Suspended driver ID
    output );
    dbms_output.put_line('Test Case 9 - Driver is suspended: '
                         || output);
END;
/

-- Test Case 10: Exceeded vehicle passenger limit
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 1, 20, -- Excessive number of passengers
    to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2001, output );
    dbms_output.put_line('Test Case 10 - Exceeded vehicle passenger limit: '
                         || output);
END;
/

-- Test 11: Trip already exists
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip( 2, 8, to_date('2024-07-22 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1HGCM82633A123450', 'Bercy Arena', 'Champ de Mars Arena', 'French', 2002 , output );
    dbms_output.put_line('Test Case 11 - Trip already exists '
                         || output);
END;
/

-- Test 12: Successful Insert
DECLARE
    output VARCHAR2(2000);
BEGIN
    prc_insert_trip( 1, 3, to_date('2024-07-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2024-07-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bordeaux Stadium', 'South Paris Arena', 'Georgian', '1C4SDHCT9FC614231', 2001 , output);
    dbms_output.put_line('Test Case 12 - Successful Trip insert ' || output);
END;
/

commit;