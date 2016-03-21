Use fnalpractice;

Create table WebServiceResponse
(
id integer auto_increment primary key,
webserviceid integer,
user integer,
start_time long,
end_time long,
response_time long
);

Create table WebService
(
id integer auto_increment primary key,
webservice_url varchar(255)
);


