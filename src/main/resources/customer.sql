drop sequence customers_sequence;
create sequence customers_sequence increment by 1 start with 1;

drop table customers;

create table customers (
    ID  number not null,
    USERNAME varchar2(255) not null,
    PASSWORD varchar2(255) not null,
    FIRST_NAME varchar2(255 char) not null,
    LAST_NAME varchar2(255 char) not null,
    EMAIL varchar2(255) not null unique,
    PHONE varchar2(13) not null unique,
    BIRTHDAY date,
    GENDER varchar2(32) not null,
    GRADE char(32),
    CREATE_DATE date default SYSDATE,
    UPDATE_DATE date default SYSDATE,
    ENABLED number default 1,
    primary key (ID)
);