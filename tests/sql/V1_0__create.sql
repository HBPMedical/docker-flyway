CREATE TABLE test
(
  id character varying(128) NOT NULL,
  key character varying(32) NOT NULL,
  timestamp timestamp default now(),
  value text,

  CONSTRAINT pk_test PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
