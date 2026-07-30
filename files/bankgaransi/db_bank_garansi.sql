-- Drop tables in reverse order of dependencies
-- First drop tables that have foreign key references to other tables

-- trx_head references multiple tables
DROP TABLE IF EXISTS trx_head CASCADE;

-- ref_pengajuan references trx_head
DROP TABLE IF EXISTS ref_pengajuan CASCADE;


-- ref_project referenced by trx_head
DROP TABLE IF EXISTS ref_project CASCADE;



-- trx_token_bank has no dependencies
DROP TABLE IF EXISTS trx_token_bank CASCADE;


DROP TYPE IF EXISTS guarantee_type;

create table trx_head(
  id_head_ref serial primary key,
  id_additional_info int4,
  id_project int4,
  id_recipient int4,
  id_pengajuan int4,
  id_guarantee int4
);


DROP TYPE IF EXISTS status_pengajuan;
CREATE TYPE status_pengajuan AS ENUM ('success', 'failed', 'closed');
DROP TYPE IF EXISTS closure_type;
CREATE TYPE closure_type AS ENUM ('principal_reason', 'expired', 'claimed');

-- ref_pengajuan references trx_head
DROP TABLE IF EXISTS ref_pengajuan CASCADE;
create table ref_pengajuan(
  id_pengajuan serial primary key,
  refrenceId varchar,
  partnerRefrenceNo varchar,
  id_head_ref int4,
  kode_unit varchar,
  kode_vendor int4,
  status status_pengajuan,
  kode_aplikasi varchar(2),
  closureType closure_type,
  ucr varchar,
  uch varchar,
  udcr timestamptz,
  udch timestamptz
);


-- ref_additional_info referenced by trx_head
DROP TABLE IF EXISTS ref_additional_info CASCADE;
create table ref_additional_info(
  id_additional_info serial primary key,
  companyName varchar,
  npwp varchar(50),
  address text,
  city varchar,
  phone varchar(50),
  contactPerson varchar,
  contactNumber varchar,
  email varchar
);

create table ref_project(
  id_project serial primary key,
  contractNumber varchar,
  contractDate date
);


-- ref_recipient referenced by trx_head
DROP TABLE IF EXISTS ref_recipient CASCADE;

create table ref_recipient(
  id_recipient serial primary key,
  name varchar,
  address text,
  city varchar,
  phone varchar,
  contactPerson varchar,
  contactNumber varchar,
  email varchar
);


CREATE TYPE guarantee_type AS ENUM ('jaminan_penawaran', 'jaminan_pelaksanaan', 'jaminan_uang_muka');

-- ref_guarantee referenced by trx_head
DROP TABLE IF EXISTS ref_guarantee CASCADE;

create table ref_guarantee(
  id_guarantee serial primary key,
  guaranteeNo varchar,
  type guarantee_type,
  amount numeric,
  currency varchar,
  issuedDate date,
  validFromDate date,
  validUntilDate date,
  issuerBank varchar,
  issuerBranch varchar
);


create table trx_token_bank (
  kode_token_bank int4 primary key,
  sandi_bank varchar,
  accessToken text,
  tokenType varchar,
  expiresIn int
);





INSERT INTO public.trx_token_bank
(kode_token_bank, sandi_bank, accesstoken, tokentype, expiresin)
VALUES(1, '200', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdG9rZW4iOiJEZWJESTNRdkVub0JRMjl6S1FlVlZTSDJoYlpTdk9xU3BoeGFGaTZ4c2x0NW9SS1puMncyeFMiLCJ0b2tlbl90eXBlIjoiQmVhcmVyIiwiZXhwaXJlc19pbiI6OTAwLCJzY29wZSI6InJlc291cmNlLldSSVRFIHJlc291cmNlLlJFQUQifQ.dFd3RzvZg7HeHEU2c8iLrY5QaWeLRti7UCFtNihXQyE', 'Bearer', 900);


