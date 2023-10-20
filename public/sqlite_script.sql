ATTACH DATABASE 'AIRLINE_SIM_DATA.db' AS AIRLINE_SIM_PROJECT;

-- Create Tables

CREATE TABLE AIRLINE_SIM_PROJECT.BRIDGE_ASSIGNEDPILOTS (
    FLIGHT_ID TEXT NOT NULL,
    PILOT_ID TEXT NOT NULL,
    FOREIGN KEY (FLIGHT_ID) REFERENCES DB_FLIGHTS(FLIGHT_ID)
    FOREIGN KEY (PILOT_ID) REFERENCES DB_PILOTS(PILOT_ID)
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_AIRCRAFT (
    AIRCRAFT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    AIRCRAFT_NAME TEXT NOT NULL,
    AIRCRAFT_TYPE TEXT NOT NULL,
    PASSENGER_CAPACITY INTEGER NOT NULL
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_AIRPORTS (
    AIRPORT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    AIRPORT_NAME TEXT NOT NULL,
    AIRPORT_COUNTRY TEXT NOT NULL,
    AIRPORT_CITY TEXT NOT NULL
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_ARRIVALS (
    ARRIVAL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    SCH_ARR_DATETIME DATETIME NOT NULL,
    ARR_AIRPORT_ID TEXT NOT NULL,
    ARR_TERMINAL TEXT NOT NULL,
    FOREIGN KEY (ARR_AIRPORT_ID) REFERENCES DB_AIRPORTS(AIRPORT_ID)
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_CABINCREWS (
    CREW_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CREW_NAME TEXT NOT NULL,
    CREW_DETAILS TEXT
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_DEPARTURES (
    DEPARTURE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    SCH_DEPR_DATETIME DATETIME NOT NULL,
    DEP_AIRPORT_ID TEXT NOT NULL,
    DEP_TERMINAL TEXT NOT NULL,
    FOREIGN KEY (DEP_AIRPORT_ID) REFERENCES DB_AIRPORTS(AIRPORT_ID)
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_EMPLOYEE (
    EMP_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    EMP_LAST_NAME TEXT NOT NULL,
    EMP_FIRST_NAME TEXT NOT NULL,
    EMP_ROLE TEXT NOT NULL,
    EMP_CREW_ID TEXT,
    EMP_GENDER TEXT NOT NULL,
    EMP_ANNUAL REAL NOT NULL,
    CONTACT_DETAILS TEXT
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_FLIGHTS (
    FLIGHT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    DEPARTURE_ID TEXT NOT NULL,
    ARRIVAL_ID TEXT NOT NULL,
    CREW_ID TEXT NOT NULL,
    AIRCRAFT_ID TEXT NOT NULL,
    FLIGHT_DURATION TEXT NOT NULL,
    FOREIGN KEY (DEPARTURE_ID) REFERENCES DB_DEPARTURES(DEPARTURE_ID),
    FOREIGN KEY (ARRIVAL_ID) REFERENCES DB_ARRIVALS(ARRIVAL_ID),
    FOREIGN KEY (CREW_ID) REFERENCES DB_CABINCREWS(CREW_ID),
    FOREIGN KEY (AIRCRAFT_ID) REFERENCES DB_AIRCRAFT(AIRCRAFT_ID)
);

CREATE TABLE AIRLINE_SIM_PROJECT.DB_PILOTS (
    PILOT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    EMP_ID TEXT NOT NULL,
    LICENSE_TYPE TEXT NOT NULL,
    PASSPORT_NO TEXT NOT NULL,
    ORIGIN_COUNTRY TEXT NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES DB_EMPLOYEE(EMP_ID)
);


-- Insert Data

INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('101', '1001');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('101', '1002');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('102', '1003');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('102', '1004');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('103', '1005');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('103', '1006');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('104', '1003');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('104', '1004');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('105', '1001');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('105', '1002');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('106', '1005');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('106', '1006');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('107', '1003');
INSERT INTO [BRIDGE_ASSIGNEDPILOTS] ([FLIGHT_ID], [PILOT_ID]) VALUES ('107', '1004');

INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5001', 'Boeing 747', 'Commercial', 150);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5002', 'Airbus A320', 'Commercial', 250);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5003', 'Cessna 172', 'Private', 6);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5004', 'Boeing 747', 'Commercial', 150);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5005', 'Embraer E190', 'Commercial', 100);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5006', 'Airbus A330', 'Commercial', 250);
INSERT INTO [DB_AIRCRAFT] ([AIRCRAFT_ID], [AIRCRAFT_NAME], [AIRCRAFT_TYPE], [PASSENGER_CAPACITY]) VALUES ('5007', 'Cessna Citation', 'Private', 10);

INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('601', 'John F. Kennedy International Airport', 'USA', 'New York');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('602', 'Heathrow Airport', 'UK', 'London');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('603', 'Los Angeles International Airport', 'USA', 'Los Angeles');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('604', 'Charles de Gaulle Airport', 'France', 'Paris');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('605', 'Beijing Capital International Airport', 'China', 'Beijing');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('606', 'Dubai International Airport', 'UAE', 'Dubai International');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('607', 'Sydney Kingsford Smith Airport', 'Australia', 'Sydney');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('608', 'Incheon International Airport', 'South Korea', 'Seoul');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('609', 'Singapore Changi Airport', 'Singapore', 'Singapore');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('610', 'Tokyo Narita International Airport', 'Japan', 'Tokyo');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('611', 'Chica O''Hare International Airport ', 'USA', 'Chicago');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('612', 'Frankfurt Airport', 'Germany', 'Frankfurt');
INSERT INTO [DB_AIRPORTS] ([AIRPORT_ID], [AIRPORT_NAME], [AIRPORT_COUNTRY], [AIRPORT_CITY]) VALUES ('613', 'Hong Kong International Airport', 'Hong Kong', 'Hong Kong');

INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('301', '2023-10-13T12:00:00.000', '602', 'Terminal X');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('302', '2023-10-13T13:30:00.000', '604', 'Terminal Y');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('303', '2023-10-13T15:00:00.000', '606', 'Terminal Z');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('304', '2023-10-13T16:30:00.000', '608', 'Terminal W');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('305', '2023-10-13T18:00:00.000', '610', 'Terminal V');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('306', '2023-10-13T19:30:00.000', '612', 'Terminal U');
INSERT INTO [DB_ARRIVALS] ([ARRIVAL_ID], [SCH_ARR_DATETIME], [ARR_AIRPORT_ID], [ARR_TERMINAL]) VALUES ('307', '2023-10-13T21:00:00.000', '607', 'Terminal T');

INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('401', 'Flight Crew 1', 'Pilots and Flight Attendants');
INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('402', 'Flight Crew 2', 'Veteran Pilots and Flight Attendants');
INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('403', 'Ground Crew 1', 'Ground Operations Staff');
INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('404', 'Flight Crew 3', 'Pilots and Flight Attendants');
INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('405', 'Ground Crew 2', 'Ground Operations Staff');
INSERT INTO [DB_CABINCREWS] ([CREW_ID], [CREW_NAME], [CREW_DETAILS]) VALUES ('406', 'Flight Crew 4', 'Pilots and Flight Attendants');

INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('201', '2023-10-13T09:00:00.000', '601', 'Terminal A');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('202', '2023-10-13T10:30:00.000', '603', 'Terminal B');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('203', '2023-10-13T12:00:00.000', '605', 'Terminal C');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('204', '2023-10-13T13:30:00.000', '607', 'Terminal D');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('205', '2023-10-13T15:00:00.000', '609', 'Terminal E');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('206', '2023-10-13T16:30:00.000', '611', 'Terminal F');
INSERT INTO [DB_DEPARTURES] ([DEPARTURE_ID], [SCH_DEPR_DATETIME], [DEP_AIRPORT_ID], [DEP_TERMINAL]) VALUES ('207', '2023-10-13T18:00:00.000', '613', 'Terminal G');

INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1001', 'John', 'Smith', 'Pilot', '401', 'Male', '75,000', 'john.smith@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1002', 'Mary', 'Johnson', 'Pilot', '401', 'Female', '70,000', 'mary.johnson@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1003', 'Michael', 'Williams', 'Flight Attendant', '402', 'Male', '50,000', 'michael.williams@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1004', 'Sarah', 'Davis', 'Flight Attendant', '402', 'Female', '48,000', 'sarah.davis@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1005', 'Roberta', 'Wilson', 'Ground Crew', '402', 'Female', '40,000', 'roberta.wilson@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1006', 'Lisa', 'Brown', 'Ground Crew', '403', 'Female', '38,000', 'lisa.brown@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1007', 'James', 'Lee', 'Pilot', '404', 'Male', '80,000', 'james.lee@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1008', 'Emily', 'Chen', 'Pilot', '404', 'Female', '83,000', 'emily.chen@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1009', 'David', 'Kim', 'Flight Attendant', '405', 'Male', '55,000', 'david.kim@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1010', 'Samuel', 'Garcia', 'Flight Attendant', '405', 'Male', '52,000', 'sam.garcia@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1011', 'William', 'Anderson', 'Ground Crew', '405', 'Male', '42,000', 'will.anderson@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1012', 'Laura', 'Martinez', 'Pilot', '406', 'Female', '73,000', 'laura.martinez@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1013', 'Kevin', 'Harris', 'Ground Crew', '403', 'Male', '42,000', 'k.harris@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1014', 'Amanda', 'Wilson', 'Flight Attendant', '402', 'Female', '50,000', 'amanda.wilson@email.com');
INSERT INTO [DB_EMPLOYEE] ([EMP_ID], [EMP_FIRST_NAME], [EMP_LAST_NAME], [EMP_ROLE], [EMP_CREW_ID], [EMP_GENDER], [EMP_ANNUAL], [CONTACT_DETAILS]) VALUES ('1015', 'Charles', 'Turner', 'Pilot', '404', 'Male', '78,000', 'c.turner@email.com');

INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('101', '201', '301', '401', '5001', '03:30:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('102', '202', '302', '402', '5002', '02:45:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('103', '203', '303', '406', '5003', '04:15:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('104', '204', '304', '404', '5004', '02:00:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('105', '205', '305', '402', '5005', '05:15:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('106', '206', '306', '406', '5006', '03:15:00');
INSERT INTO [DB_FLIGHTS] ([FLIGHT_ID], [DEPARTURE_ID], [ARRIVAL_ID], [CREW_ID], [AIRCRAFT_ID], [FLIGHT_DURATION]) VALUES ('107', '207', '307', '404', '5007', '04:00:00');

INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1001', '1001', 'Commercial', 'US123456', 'USA');
INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1002', '1002', 'Commercial', 'UK789012', 'UK');
INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1003', '1007', 'Commercial', 'US234567', 'USA');
INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1004', '1008', 'Commercial', 'UK890123', 'UK');
INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1005', '1012', 'Private', 'CN456789', 'China');
INSERT INTO [DB_PILOTS] ([PILOT_ID], [EMP_ID], [LICENSE_TYPE], [PASSPORT_NO], [ORIGIN_COUNTRY]) VALUES ('1006', '1015', 'Private', 'AE123456', 'UAE');

PRAGMA AIRLINE_SIM_PROJECT.read_only = 0;

