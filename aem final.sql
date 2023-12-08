CREATE DATABASE aem;
USE aem;
CREATE TABLE Events (
   event_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name varchar(255),
   description text,
   start_time_date datetime,
   end_date_time datetime,
   capacity int,
   abstract_deadline datetime,
   venue varchar(255),
   university varchar(255),
   street_address varchar(255),
   city varchar(255),
   state varchar(255),
   zipcode varchar(10),
   e_event_type_id int,
   e_event_status_id  int,
   e_user_id int
);

CREATE TABLE  EventTypes  (
   event_type_id  int AUTO_INCREMENT PRIMARY KEY,
   event_type  varchar(255)
);

CREATE TABLE  EventStatuses (
  event_status_id int AUTO_INCREMENT PRIMARY KEY,
   status varchar(255)
);

CREATE TABLE Organizers (
  email varchar(255) PRIMARY KEY,
  institution varchar(255),
  first_name varchar(255),
  last_name varchar(255),
  o_event_id int,
  o_organizer_type_id int
);

CREATE TABLE OrganizerTypes (
  organizer_type_id int AUTO_INCREMENT PRIMARY KEY,
  organizer_type varchar(255)
);

CREATE TABLE Users (
    user_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255),
    first_name varchar(255),
    last_name varchar(255),
    phone_1 varchar(255),
    phone_2 varchar(255),
	email varchar(255),
	password varchar(255)
);

CREATE TABLE Roles (
   role_id int AUTO_INCREMENT PRIMARY KEY,
   role varchar(255)
);

CREATE TABLE Reviews (
   reviews_id int AUTO_INCREMENT PRIMARY KEY,
   note text,
   r_abstract_id int,
   r_user_id int,
   r_events_id int,
   r_status_id int
);

CREATE TABLE Statuses (
	status_id int AUTO_INCREMENT PRIMARY KEY,
	status varchar(255)
);

CREATE TABLE Abstracts (
  abstract_id int PRIMARY KEY AUTO_INCREMENT,
  title varchar(255),
  abstract text,
  mentor_fname varchar(255),
  mentor_lname varchar(255),
  mentor_email varchar(255),
  mentor_institution varchar(255),
  presenter_fname varchar(255),
  presenter_lname varchar(255),
  presenter_email varchar(255),
  presenter_institution varchar(255),
  a_subject_area_id int,
  a_abstract_type_id int
);

CREATE TABLE SubjectAreas (
  subject_area_id int AUTO_INCREMENT PRIMARY KEY,
  subject_area varchar(255)
);

CREATE TABLE AbstractTypes (
  abstract_type_id int AUTO_INCREMENT PRIMARY KEY,
  subject_area varchar(255)
);

CREATE TABLE Presenters (
  email varchar(255) PRIMARY KEY,
  first_name varchar(255),
  last_name varchar(255),
  institution varchar(255),
  p_abstract_id int
);

CREATE TABLE Reviewers (
  rev_event_id int AUTO_INCREMENT PRIMARY KEY,
  rev_user_id int
);

CREATE TABLE HasRole (
  h_role_id int AUTO_INCREMENT PRIMARY KEY,
  h_user_id int
);

ALTER TABLE Events ADD FOREIGN KEY (e_event_type_id) REFERENCES EventTypes (event_type_id);

ALTER TABLE Events ADD FOREIGN KEY (e_event_status_id) REFERENCES EventStatuses (event_status_id);

ALTER TABLE Events ADD FOREIGN KEY (e_user_id) REFERENCES Users (user_id);

ALTER TABLE Organizers ADD FOREIGN KEY (o_event_id) REFERENCES Events (event_id);

ALTER TABLE Organizers ADD FOREIGN KEY (o_organizer_type_id) REFERENCES OrganizerTypes (organizer_type_id);

ALTER TABLE Reviews ADD FOREIGN KEY (r_abstract_id) REFERENCES Abstracts (abstract_id);

ALTER TABLE Reviews ADD FOREIGN KEY (r_user_id) REFERENCES Users (user_id);

ALTER TABLE Reviews ADD FOREIGN KEY (r_events_id) REFERENCES Events (event_id);

ALTER TABLE Reviews ADD FOREIGN KEY (r_status_id) REFERENCES Statuses (status_id);

ALTER TABLE Abstracts ADD FOREIGN KEY (a_subject_area_id) REFERENCES SubjectAreas (subject_area_id);

ALTER TABLE Abstracts ADD FOREIGN KEY (a_abstract_type_id) REFERENCES AbstractTypes (abstract_type_id);

ALTER TABLE Presenters ADD FOREIGN KEY (p_abstract_id) REFERENCES Abstracts (abstract_id);

ALTER TABLE Reviewers ADD FOREIGN KEY (rev_event_id) REFERENCES Events (event_id);

ALTER TABLE Reviewers ADD FOREIGN KEY (rev_user_id) REFERENCES Users (user_id);

ALTER TABLE HasRole ADD FOREIGN KEY (h_role_id) REFERENCES Roles (role_id);

ALTER TABLE HasRole ADD FOREIGN KEY (h_user_id) REFERENCES Users (user_id);