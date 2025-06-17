/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pat-mods.sql

--Student ID: 33156905
--Student Name: Anand Vannalath


/* Comments for your marker:
*/

/*(a)*/

-- Initial Data
desc official;

SELECT
    *
FROM
    official;

SELECT
    *
FROM
    official
WHERE
    off_id = 1;

-- Modifications of Official
ALTER TABLE official
    ADD off_role VARCHAR(
        32
    ) DEFAULT 'General';

COMMENT ON COLUMN official.off_role IS 'Role of the official.';

ALTER TABLE official
    ADD CONSTRAINT check_off_role CHECK (
        off_role IN ('General', 'Adminstrator', 'Head Coach', 'Coach', 'Physician')
    );

-- Altered Data
desc official;

SELECT
    *
FROM
    official;

SELECT
    *
FROM
    official
WHERE
    off_id = 1;

COMMIT;

/*(b)*/

-- Creation of Tables
drop table complaint;

drop table complaint_category;

CREATE TABLE complaint (
    comp_id NUMERIC(4) NOT NULL,
    trip_id NUMERIC(4) NOT NULL,
    off_id NUMERIC(4) NOT NULL,
    comp_category_id NUMERIC(4) NOT NULL,
    comp_date_time DATE NOT NULL,
    comp_description VARCHAR(255) NOT NULL,
    comp_valid VARCHAR(2) DEFAULT 'NV' NOT NULL
);

COMMENT ON COLUMN complaint.comp_id IS 'Unique identifier for each complaint.';
COMMENT ON COLUMN complaint.trip_id IS 'Unique identifier for the trip the complaint was made on';
COMMENT ON COLUMN complaint.off_id IS 'The official who lodged the complaint';
COMMENT ON COLUMN complaint.comp_category_id IS 'Category of the complaint.';
COMMENT ON COLUMN complaint.comp_date_time IS 'Date and time when the complaint was filed.';
COMMENT ON COLUMN complaint.comp_description IS 'Brief description of the complaint.';
COMMENT ON COLUMN complaint.comp_valid IS 'Current status of the complaint.';

CREATE TABLE complaint_category (
    comp_category_id NUMERIC(4) NOT NULL,
    comp_category_type VARCHAR(50) NOT NULL,
    demerit_pts NUMERIC(4) NOT NULL
);

COMMENT ON COLUMN complaint_category.comp_category_id IS 'Unique identifier for each category of complaint.';
COMMENT ON COLUMN complaint_category.comp_category_type IS 'Type or category of the complaint.';
COMMENT ON COLUMN complaint_category.demerit_pts IS 'Number of demerit points assigned for this category of complaint.';

desc complaint;

desc complaint_category;

SELECT
    *
FROM
    complaint;

SELECT
    *
FROM
    complaint_category;

-- Primary Keys
ALTER TABLE complaint
    ADD CONSTRAINT complaint_pk PRIMARY KEY (
        comp_id,
        trip_id,
        off_id
    );

ALTER TABLE complaint_category
    ADD CONSTRAINT complaint_category_pk PRIMARY KEY (
        comp_category_id
    );

-- Foreign Key Constraints
ALTER TABLE complaint
    ADD CONSTRAINT complaint_trip_pk FOREIGN KEY (
        trip_id
    )
        REFERENCES trip (
            trip_id
        );

ALTER TABLE complaint
    ADD CONSTRAINT complaint_category_fk FOREIGN KEY (
        comp_category_id
    )
        REFERENCES complaint_category (
            comp_category_id
        );

ALTER TABLE complaint
    ADD CONSTRAINT complaint_official_fk FOREIGN KEY (
        off_id
    )
        REFERENCES official (
            off_id
        );

-- Check Constraints for valid complaint categories
ALTER TABLE complaint
    ADD CONSTRAINT check_complaint_valid CHECK (
        comp_valid IN ('NV', 'V')
    );

-- Ensures categories are unique
ALTER TABLE complaint_category
    add constraint check_comp_category_type UNIQUE (
        comp_category_type
    );

-- Ensure demerit points are non-negative
ALTER TABLE complaint_category
    ADD CONSTRAINT check_demerit_pts CHECK (
        demerit_pts >= 0
    );

-- Ensures official cannot make two complaints at the exact same time on the same trip
ALTER TABLE complaint add constraint check_no_of_complaints UNIQUE (
    trip_id,
    off_id,
    comp_date_time
);

commit;
-- Adding data

desc complaint;

desc complaint_category;

SELECT
    *
FROM
    complaint;

SELECT
    *
FROM
    complaint_category;

INSERT INTO complaint_category VALUES (
    1,
    'late arrival',
    1
);

INSERT INTO complaint_category VALUES (
    2,
    'rude behaviour',
    2
);

INSERT INTO complaint_category VALUES (
    3,
    'poor driving',
    2
);

INSERT INTO complaint_category VALUES (
    4,
    'failing to assist',
    1
);

SELECT
    *
FROM
    complaint;

SELECT
    *
FROM
    complaint_category;

commit;