ALTER TABLE picture  DROP CONSTRAINT fkdd905cfef7634dfa;	  
ALTER TABLE picture  DROP CONSTRAINT fkdd905cfe9d32df1a;
ALTER TABLE news  DROP CONSTRAINT fk338ad3f7634dfa;
ALTER TABLE "comment"  DROP CONSTRAINT fk38a5ee5ff7634dfa;
ALTER TABLE "comment"  DROP CONSTRAINT fk38a5ee5fe38000da;

ALTER TABLE picture  DROP CONSTRAINT picture_pkey;
ALTER TABLE people  DROP CONSTRAINT people_pkey;
ALTER TABLE news  DROP CONSTRAINT news_pkey;
ALTER TABLE "comment"  DROP CONSTRAINT comment_pkey;
ALTER TABLE folder  DROP CONSTRAINT folder_pkey;

alter table folder add column investment_id bigint NOT NULL default 1;

CREATE TABLE investment (id bigint NOT NULL, version bigint NOT NULL, date_created timestamp without time zone NOT NULL, name character varying(255) NOT NULL, user_id bigint NOT NULL);

insert into investment(id, version, date_created, name, user_id) values(1,0,'2009-07-27 07:26:00','Zurawinka 2 Ani i Alka', 1);
alter table people add column is_admin boolean not null default false;
update people set is_admin=true where id=1;
alter table news add column investment_id bigint NOT NULL default 1;
alter table news drop column user_id;

ALTER TABLE ONLY "comment" ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
ALTER TABLE ONLY folder    ADD CONSTRAINT folder_pkey PRIMARY KEY (id);
ALTER TABLE ONLY investment ADD CONSTRAINT investment_pkey PRIMARY KEY (id);
ALTER TABLE ONLY news      ADD CONSTRAINT news_pkey PRIMARY KEY (id);
ALTER TABLE ONLY people    ADD CONSTRAINT people_pkey PRIMARY KEY (id);
ALTER TABLE ONLY picture   ADD CONSTRAINT picture_pkey PRIMARY KEY (id);
ALTER TABLE ONLY news      ADD CONSTRAINT fk338ad3f3adf8fa FOREIGN KEY (investment_id) REFERENCES investment(id);
ALTER TABLE ONLY "comment" ADD CONSTRAINT fk38a5ee5fe38000da FOREIGN KEY (picture_id) REFERENCES picture(id);
ALTER TABLE ONLY "comment" ADD CONSTRAINT fk38a5ee5ff7634dfa FOREIGN KEY (user_id) REFERENCES people(id);
ALTER TABLE ONLY investment ADD CONSTRAINT fk72fa32d3f7634dfa FOREIGN KEY (user_id) REFERENCES people(id);
ALTER TABLE ONLY folder    ADD CONSTRAINT fkb45d1c6ef3adf8fa FOREIGN KEY (investment_id) REFERENCES investment(id);
ALTER TABLE ONLY picture   ADD CONSTRAINT fkdd905cfe9d32df1a FOREIGN KEY (folder_id) REFERENCES folder(id);
ALTER TABLE ONLY picture   ADD CONSTRAINT fkdd905cfef7634dfa FOREIGN KEY (user_id) REFERENCES people(id);

