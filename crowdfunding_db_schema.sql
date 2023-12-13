-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Campaign"
(
    cf_id bigint NOT NULL,
    contact_id bigint NOT NULL,
    company_name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    goal money NOT NULL,
    pledged money NOT NULL,
    outcome character varying COLLATE pg_catalog."default" NOT NULL,
    backers_count character varying COLLATE pg_catalog."default" NOT NULL,
    country character(2) COLLATE pg_catalog."default" NOT NULL,
    currency character(3) COLLATE pg_catalog."default" NOT NULL,
    launched_date date NOT NULL,
    end_date date NOT NULL,
    category_id character(10) COLLATE pg_catalog."default" NOT NULL,
    subcategory_id character(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Campaign_pkey" PRIMARY KEY (cf_id)
);

CREATE TABLE IF NOT EXISTS public."Category"
(
    category_id character(10) COLLATE pg_catalog."default" NOT NULL,
    category character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Category_pkey" PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS public."Contacts"
(
    contact_id bigint NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Contacts_pkey" PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public."Crowdfunding"
(
    cf_id bigint NOT NULL,
    contact_id bigint NOT NULL,
    company_name character varying COLLATE pg_catalog."default" NOT NULL,
    blurb character varying COLLATE pg_catalog."default" NOT NULL,
    goal money NOT NULL,
    pledged money NOT NULL,
    outcome character varying COLLATE pg_catalog."default" NOT NULL,
    backers_count integer NOT NULL,
    country character(2) COLLATE pg_catalog."default" NOT NULL,
    currency character(3) COLLATE pg_catalog."default" NOT NULL,
    launched_at bigint,
    deadline bigint,
    staff_pick boolean,
    spotlight boolean,
    category_sub_category character varying COLLATE pg_catalog."default",
    CONSTRAINT "Crowdfunding_pkey" PRIMARY KEY (cf_id)
);

CREATE TABLE IF NOT EXISTS public."Subcategory"
(
    subcategory_id character(10) COLLATE pg_catalog."default" NOT NULL,
    subcategory character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Subcategory_pkey" PRIMARY KEY (subcategory_id)
);

ALTER TABLE IF EXISTS public."Campaign"
    ADD CONSTRAINT "Category" FOREIGN KEY (category_id)
    REFERENCES public."Category" (category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Campaign"
    ADD CONSTRAINT "Contacts" FOREIGN KEY (contact_id)
    REFERENCES public."Contacts" (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Campaign"
    ADD CONSTRAINT "Subcategory" FOREIGN KEY (subcategory_id)
    REFERENCES public."Subcategory" (subcategory_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Crowdfunding"
    ADD CONSTRAINT "Contact ID" FOREIGN KEY (contact_id)
    REFERENCES public."Contacts" (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;