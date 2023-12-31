-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


DROP TABLE IF EXISTS public.bridge_dataset;

CREATE TABLE IF NOT EXISTS public.bridge_dataset
(
    results_address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    master_list_location_id integer NOT NULL,
    CONSTRAINT bridge_dataset_pkey PRIMARY KEY (results_address, master_list_location_id),
    CONSTRAINT "unique" UNIQUE (results_address, master_list_location_id)
        INCLUDE(results_address, master_list_location_id)
);

DROP TABLE IF EXISTS public.competitor_detail;

CREATE TABLE IF NOT EXISTS public.competitor_detail
(
    results_address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    competitor_address character varying(100) COLLATE pg_catalog."default" NOT NULL
);

DROP TABLE IF EXISTS public.master_list_dataset;

CREATE TABLE IF NOT EXISTS public.master_list_dataset
(
    location_id integer NOT NULL,
    location_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    region character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT master_list_dataset_pkey PRIMARY KEY (location_id),
    CONSTRAINT unique2 UNIQUE (location_id)
);

DROP TABLE IF EXISTS public.results_dataset;

CREATE TABLE IF NOT EXISTS public.results_dataset
(
    results_address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    competitors integer,
    CONSTRAINT results_dataset_pkey PRIMARY KEY (results_address),
    CONSTRAINT unique3 UNIQUE (results_address)
);

ALTER TABLE IF EXISTS public.bridge_dataset
    ADD CONSTRAINT fk1 FOREIGN KEY (results_address)
    REFERENCES public.results_dataset (results_address) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.bridge_dataset
    ADD CONSTRAINT fk2 FOREIGN KEY (master_list_location_id)
    REFERENCES public.master_list_dataset (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.competitor_detail
    ADD CONSTRAINT fk3 FOREIGN KEY (results_address)
    REFERENCES public.results_dataset (results_address) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;