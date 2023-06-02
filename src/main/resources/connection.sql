-- connection name: jhta_restaurants_sns_service
-- username: jhta
-- password: 1234

CREATE USER C##jhta IDENTIFIED BY 1234;
GRANT RESOURCE, CONNECT TO C##jhta;
grant create session, create table, create procedure to C##jhta;
ALTER USER C##jhta quota unlimited on USERS;