--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-pat-schema.sql

--Student ID: 33156905
--Student Name: Anand Vannalath


/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- OFFICIAL
CREATE TABLE official (
    off_id NUMERIC(4) NOT NULL,
    off_given VARCHAR(30),
    off_family VARCHAR(30),
    cr_ioc_code CHAR(3) NOT NULL,
    off_cdm NUMERIC(4)
);

COMMENT ON COLUMN official.off_id IS 'Identifier for an official';
COMMENT ON COLUMN official.off_given IS 'Given name for the official';
COMMENT ON COLUMN official.off_family IS 'Family name for the official';
COMMENT ON COLUMN official.cr_ioc_code IS 'IOC country code for the official';
COMMENT ON COLUMN official.off_cdm IS 'Identifier for Chef De Mission for the official';

ALTER TABLE official
    ADD CONSTRAINT official_pk PRIMARY KEY(
        off_id
    );

-- Ensures Chef de Mission is unique for each country
ALTER TABLE official
    ADD CONSTRAINT unique_chef_de_mission UNIQUE (
        off_id,
        cr_ioc_code
    );

commit;

-- VEHICLE
CREATE TABLE vehicle (
    veh_vin CHAR(17) NOT NULL,
    veh_rego CHAR(7) NOT NULL,
    veh_year DATE NOT NULL,
    veh_curr_odo NUMERIC(6) NOT NULL,
    veh_nopassengers NUMERIC(2) NOT NULL,
    vm_model_id NUMERIC(4) NOT NULL
);

COMMENT ON COLUMN vehicle.veh_vin IS 'Identifier for vehicle';
COMMENT ON COLUMN vehicle.veh_rego IS 'Registration plate of vehicle';
COMMENT ON COLUMN vehicle.veh_year IS 'Year of manufacture of vehicle';
COMMENT ON COLUMN vehicle.veh_curr_odo IS 'Current odometer reading of vehicle';
COMMENT ON COLUMN vehicle.veh_nopassengers IS 'Number of passengers vehicle can seat';
COMMENT ON COLUMN vehicle.vm_model_id IS 'Identifier for vehicle_model';

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_pk PRIMARY KEY(
        veh_vin
    );

commit;

-- TRIP
CREATE TABLE trip (
    trip_id NUMERIC(4) NOT NULL,
    trip_nopassenegers NUMERIC(2) NOT NULL,
    trip_int_pickupdt DATE NOT NULL,
    trip_act_pickupdt DATE,
    trip_int_dropoffdt DATE NOT NULL,
    trip_act_dropoffdt DATE,
    veh_vin CHAR(17) NOT NULL,
    driver_id NUMERIC(4) NOT NULL,
    pickup_locn_id NUMERIC(3) NOT NULL,
    dropoff_locn_id NUMERIC(3) NOT NULL,
    lang_iso_code CHAR(2) NOT NULL,
    off_id NUMERIC(4) NOT NULL
);

COMMENT ON COLUMN trip.trip_id IS 'Identifier for a trip';
COMMENT ON COLUMN trip.trip_nopassenegers IS 'Number of passengers for the trip';
COMMENT ON COLUMN trip.trip_int_pickupdt IS 'Intended pickup date and time for the trip';
COMMENT ON COLUMN trip.trip_act_pickupdt IS 'Actual pickup date and time for the trip';
COMMENT ON COLUMN trip.trip_int_dropoffdt IS 'Intended drop-off date and time for the trip';
COMMENT ON COLUMN trip.trip_act_dropoffdt IS 'Actual drop-off date and time for the trip';
COMMENT ON COLUMN trip.veh_vin IS 'Identifier for a vehicle';
COMMENT ON COLUMN trip.driver_id IS 'Identifier for a driver';
COMMENT ON COLUMN trip.pickup_locn_id IS 'Identifier for the pick-up location';
COMMENT ON COLUMN trip.dropoff_locn_id IS 'Identifier for the drop-off location';
COMMENT ON COLUMN trip.lang_iso_code IS 'ISO639-1 two-character language codes';
COMMENT ON COLUMN trip.off_id IS 'Identifier for an official';

ALTER TABLE trip
    ADD CONSTRAINT trip_pk PRIMARY KEY(
        trip_id
    );

-- Ensure the intended pickup time is before dropoff time
ALTER TABLE trip
    ADD CONSTRAINT chk_trip_date CHECK (
        trip_int_pickupdt < trip_int_dropoffdt
    );

-- Ensure the same vehicle cannot be used for overlapping trips
ALTER TABLE trip
    ADD CONSTRAINT unique_trip_vehicle_time UNIQUE (
        veh_vin,
        trip_int_pickupdt,
        trip_int_dropoffdt
    );

-- Ensure the same driver is not scheduled for overlapping trips with the same vehicle
ALTER TABLE trip
    ADD CONSTRAINT unique_driver_vehicle_time UNIQUE (
        driver_id,
        veh_vin,
        trip_int_pickupdt,
        TRIP_INT_DROPOFFDT
    );

-- Ensure the same driver cannot be allocated to two trips at the same date and time
alter table trip 
    add constraint unique_driver_time UNIQUE (
        driver_id,
        TRIP_INT_DROPOFFDT,
        TRIP_ACT_PICKUPDT
    );

-- Ensure passengers are allocated to a trip
ALTER TABLE trip
    ADD CONSTRAINT chk_trip_nopassengers CHECK (
        trip_nopassenegers > 0
    );

commit;

-- OFFICIAL FKs
ALTER TABLE official
    ADD CONSTRAINT official_cr_ioc_code_fk FOREIGN KEY (
        cr_ioc_code
    )
        REFERENCES country_region (
            cr_ioc_code
        );

-- VEHICLE FKs
ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_model_id_fk FOREIGN KEY (
        vm_model_id
    )
        REFERENCES vehicle_model (
            vm_model_id
        );

-- TRIP FKs
ALTER TABLE trip
    ADD CONSTRAINT trip_pickup_locn_id_fk FOREIGN KEY (
        pickup_locn_id
    )
        REFERENCES location (
            locn_id
        );

ALTER TABLE trip
    ADD CONSTRAINT trip_dropoff_locn_id_fk FOREIGN KEY (
        dropoff_locn_id
    )
        REFERENCES location (
            locn_id
        );

ALTER TABLE trip
    ADD CONSTRAINT trip_lang_iso_code_fk FOREIGN KEY (
        lang_iso_code
    )
        REFERENCES language (
            lang_iso_code
        );

ALTER TABLE trip
    ADD CONSTRAINT trip_off_id_fk FOREIGN KEY (
        off_id
    )
        REFERENCES official (
            off_id
        );

commit;