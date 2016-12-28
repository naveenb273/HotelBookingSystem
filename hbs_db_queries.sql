-- Database: hbsdb

-- DROP DATABASE hbsdb;

CREATE DATABASE hbsdb
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_India.1252'
       LC_CTYPE = 'English_India.1252'
       CONNECTION LIMIT = -1;

ALTER DATABASE hbsdb SET datestyle TO "ISO, MDY";
	   
-- Table: city_hotel_list

-- DROP TABLE city_hotel_list;

CREATE TABLE city_hotel_list
(
  city_name text NOT NULL, -- list of city names
  hotel_name text NOT NULL, -- list of hotel names in city
  CONSTRAINT city_hotel_list_pkey PRIMARY KEY (city_name, hotel_name),
  CONSTRAINT city_hotel_list_city_hotels_key UNIQUE (city_name, hotel_name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE city_hotel_list
  OWNER TO postgres;
COMMENT ON TABLE city_hotel_list
  IS 'city hotel relation table';
COMMENT ON COLUMN city_hotel_list.city_name IS 'list of city names';
COMMENT ON COLUMN city_hotel_list.hotel_name IS 'list of hotel names in city';

-- Insert Script from city_hotel_list table
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Taj Vivantha'                );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Marammana Jopdi'             );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'The Leela Palace'            );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Radisson Blu Riverside'      );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Hotel Priya Sagar'           );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Hotel Mandarathi'            );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Bengaluru'  , 'Hotel Ekka'                  );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'The Oberoi'                  );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'Sulekere Shivarudrappa Hotel');
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'Windson Manor'               );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'Venkateshwara'               );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'Virabhadra Lodge'            );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Chitradurga', 'Hotel SuperStar'             );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'Hotel Chalukya'              );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'Davanagere Devdasa Hotel'    );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'ITC Royal Gardenia'          );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'Sagar'                       );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'Shiv Sagar'                  );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Davanagere' , 'Karnakara'                   );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'The Keys'                    );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'Thotadappana Jathre'         );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'Shivamoggada Shettru Hotel'  );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'Vishwa Priya'                );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'Hotel Modren'                );
INSERT INTO city_hotel_list(city_name, hotel_name) VALUES ('Shivamogga' , 'Chennama Hotel'              );

-- Table: hotel_room_list

-- DROP TABLE hotel_room_list;

CREATE TABLE hotel_room_list
(
  hotel_name text NOT NULL, -- list of hotel names
  room_number numeric(6,0) NOT NULL, -- list of room numbers in hotel
  tariff numeric(7,0) NOT NULL, -- tariff per day
  CONSTRAINT hotel_room_list_pkey PRIMARY KEY (hotel_name, room_number),
  CONSTRAINT hotel_room_list_hotel_name_room_number_key UNIQUE (hotel_name, room_number)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hotel_room_list
  OWNER TO postgres;
COMMENT ON TABLE hotel_room_list
  IS 'hotel room relation table';
COMMENT ON COLUMN hotel_room_list.hotel_name IS 'list of hotel names';
COMMENT ON COLUMN hotel_room_list.room_number IS 'list of room numbers in hotel';
COMMENT ON COLUMN hotel_room_list.tariff IS 'tariff per day';

INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 1001, 25000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 1002, 25000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 1003, 25000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 2001, 35000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 2002, 35000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 2003, 35000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 3001, 45000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 3002, 45000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 3003, 45000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 4001, 55000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 4002, 55000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Taj Vivantha', 4003, 55000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 1001, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 1002, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 1003, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 2001, 36000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 2002, 36000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 2003, 36000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 3001, 42000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 3002, 42000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 3003, 42000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 4001, 48000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 4002, 48000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Windson Manor', 4003, 48000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 1001, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 1002, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 1003, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 2001, 24000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 2002, 24000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 2003, 24000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 3001, 28000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 3002, 28000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 3003, 28000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 4001, 32000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 4002, 32000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Chalukya', 4003, 32000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 1001, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 1002, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 1003, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 2001, 14000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 2002, 14000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 2003, 14000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 3001, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 3002, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 3003, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 4001, 22000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 4002, 22000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Keys', 4003, 22000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 1001, 100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 1002, 100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 1003, 100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 2001, 140);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 2002, 140);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 2003, 140);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 3001, 180);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 3002, 180);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 3003, 180);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 4001, 220);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 4002, 220);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Marammana Jopdi', 4003, 220);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 1001, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 1002, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 1003, 30000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 2001, 40000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 2002, 40000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 2003, 40000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 3001, 50000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 3002, 50000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 3003, 50000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 4001, 60000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 4002, 60000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Leela Palace', 4003, 60000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 1001, 300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 1002, 300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 1003, 300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 2001, 400);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 2002, 400);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 2003, 400);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 3001, 500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 3002, 500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 3003, 500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 4001, 600);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 4002, 600);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Thotadappana Jathre', 4003, 600);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 1001, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 1002, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 1003, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 2001, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 2002, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 2003, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 3001, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 3002, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 3003, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 4001, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 4002, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('The Oberoi', 4003, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 1001, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 1002, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 1003, 5000 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 2001, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 2002, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 2003, 7500 );
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 3001, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 3002, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 3003, 10000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 4001, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 4002, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('ITC Royal Gardenia', 4003, 12500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 1001, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 1002, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 1003, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 2001, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 2002, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 2003, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 3001, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 3002, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 3003, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 4001, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 4002, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Radisson Blu Riverside', 4003, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 1001, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 1002, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 1003, 15000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 2001, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 2002, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 2003, 17500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 3001, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 3002, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 3003, 20000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 4001, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 4002, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sulekere Shivarudrappa Hotel', 4003, 22500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 1001, 16000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 1002, 16000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 1003, 16000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 2001, 18500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 2002, 18500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 2003, 18500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 3001, 21000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 3002, 21000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 3003, 21000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 4001, 23500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 4002, 23500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Davanagere Devdasa Hotel', 4003, 23500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 1001, 13000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 1002, 13000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 1003, 13000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 2001, 15500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 2002, 15500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 2003, 15500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 3001, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 3002, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 3003, 18000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 4001, 20500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 4002, 20500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shivamoggada Shettru Hotel', 4003, 20500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 1001, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 1002, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 1003, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 2001, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 2002, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 2003, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 3001, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 3002, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 3003, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 4001, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 4002, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Priya Sagar', 4003, 1200);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 1001, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 1002, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 1003, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 2001, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 2002, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 2003, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 3001, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 3002, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 3003, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 4001, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 4002, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Mandarathi', 4003, 1500);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 1001, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 1002, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 1003, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 2001, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 2002, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 2003, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 3001, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 3002, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 3003, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 4001, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 4002, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Ekka', 4003, 5000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 1001, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 1002, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 1003, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 2001, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 2002, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 2003, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 3001, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 3002, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 3003, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 4001, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 4002, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Sagar', 4003, 1000);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 1001, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 1002, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 1003, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 2001, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 2002, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 2003, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 3001, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 3002, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 3003, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 4001, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 4002, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Shiv Sagar', 4003, 1050);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 1001, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 1002, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 1003, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 2001, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 2002, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 2003, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 3001, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 3002, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 3003, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 4001, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 4002, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Karnakara', 4003, 1100);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 1001, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 1002, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 1003, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 2001, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 2002, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 2003, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 3001, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 3002, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 3003, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 4001, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 4002, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Venkateshwara', 4003, 800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 1001, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 1002, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 1003, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 2001, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 2002, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 2003, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 3001, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 3002, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 3003, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 4001, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 4002, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Virabhadra Lodge', 4003, 900);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 1001, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 1002, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 1003, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 2001, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 2002, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 2003, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 3001, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 3002, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 3003, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 4001, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 4002, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel SuperStar', 4003, 1250);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 1001, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 1002, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 1003, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 2001, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 2002, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 2003, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 3001, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 3002, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 3003, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 4001, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 4002, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Vishwa Priya', 4003, 1300);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1001, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1002, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1003, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2001, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2002, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2003, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3001, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3002, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3003, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4001, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4002, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4003, 1800);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1001, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1002, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 1003, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2001, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2002, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 2003, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3001, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3002, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 3003, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4001, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4002, 1150);
INSERT INTO hotel_room_list(hotel_name, room_number, tariff) VALUES ('Hotel Modren', 4003, 1150);



-- Table: booking_details

-- DROP TABLE booking_details;

CREATE TABLE booking_details
(
  booking_id numeric(6,0) NOT NULL, -- unique booking id for evey booking
  hotel_name text NOT NULL, -- name of the hotel
  city_name text NOT NULL, -- name of the city
  room_number numeric(6,0) NOT NULL, -- number of rooms booked
  check_in_date date NOT NULL, -- check in date
  check_out_date date NOT NULL, -- check out date
  first_name text NOT NULL, -- first name of the booking party
  last_name text NOT NULL, -- last name of the booking party
  date_of_birth date NOT NULL, -- date of birth of booking party
  ph_number numeric(11,0) NOT NULL, -- phone number of the booking party
  email_id text NOT NULL, -- email id of the booking party
  address text NOT NULL, -- address of the booking party
  ref_id_type text NOT NULL, -- referrence id type of the booking party
  ref_id_num text NOT NULL, -- reference id number of the booking party for the particular reference id type provided
  booking_ref_id text NOT NULL, -- reference id for the booking made - generated based on city-hotel-incremental number
  CONSTRAINT booking_details_pkey PRIMARY KEY (booking_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE booking_details
  OWNER TO postgres;
COMMENT ON TABLE booking_details
  IS 'booking details of every booking ';
COMMENT ON COLUMN booking_details.booking_id IS 'unique booking id for evey booking';
COMMENT ON COLUMN booking_details.hotel_name IS 'name of the hotel';
COMMENT ON COLUMN booking_details.city_name IS 'name of the city';
COMMENT ON COLUMN booking_details.room_number IS 'room numbers booked';
COMMENT ON COLUMN booking_details.check_in_date IS 'check in date';
COMMENT ON COLUMN booking_details.check_out_date IS 'check out date';
COMMENT ON COLUMN booking_details.first_name IS 'first name of the booking party';
COMMENT ON COLUMN booking_details.last_name IS 'last name of the booking party';
COMMENT ON COLUMN booking_details.date_of_birth IS 'date of birth of booking party';
COMMENT ON COLUMN booking_details.ph_number IS 'phone number of the booking party';
COMMENT ON COLUMN booking_details.email_id IS 'email id of the booking party';
COMMENT ON COLUMN booking_details.address IS 'address of the booking party';
COMMENT ON COLUMN booking_details.ref_id_type IS 'referrence id type of the booking party';
COMMENT ON COLUMN booking_details.ref_id_num IS 'reference id number of the booking party for the particular reference id type provided';
COMMENT ON COLUMN booking_details.booking_ref_id IS 'reference id for the booking made - generated based on city-hotel-incremental number';

set datestyle to MDY;
INSERT INTO booking_details(booking_id, hotel_name, city_name, room_number, check_in_date, check_out_date, first_name, last_name, date_of_birth, ph_number, email_id, address, ref_id_type, ref_id_num, booking_ref_id) VALUES (0001, 'Taj Vivantha', 'Bengaluru  ', 1001, '12/25/2016', '12/30/2016', 'Naveen', 'Basavaraj', '03/27/1989', 9535600229, 'naveenb273@gmail.com', '#11/1, Sri Bhuvaneshwari Nilaya', 'Aadhaar Card', 'abcdefg', 'HBS0001');
INSERT INTO booking_details(booking_id, hotel_name, city_name, room_number, check_in_date, check_out_date, first_name, last_name, date_of_birth, ph_number, email_id, address, ref_id_type, ref_id_num, booking_ref_id) VALUES (0002, 'Taj Vivantha', 'Bengaluru  ', 3001, '12/25/2016', '12/30/2016', 'Naveen', 'Basavaraj', '03/27/1989', 9535600229, 'naveenb273@gmail.com', '#11/1, Sri Bhuvaneshwari Nilaya', 'Aadhaar Card', 'abcdefg', 'HBS0001');