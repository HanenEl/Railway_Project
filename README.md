# Online Railway Reservation System

## Overview
The **Online Railway Reservation System** is designed to facilitate ticket booking and management for railway travelers. The system allows users to reserve tickets, manage bookings, and track their trips efficiently.

## Entity-Relationship Diagram (ERD)
The ERD illustrates the structure of the database, including entities, attributes, and relationships within the system.

## Key Entities and Their Attributes

### Passenger
Stores information about passengers:
- **ID**: Unique identifier for each passenger.
- **First_name** & **Last_name**: Passenger's first and last name.
- **Phone_num**: Contact number.
- **Address**: Passenger’s location.
- **Gender**: Male or Female.
- **Birth_date**: Date of birth.
- **Age**: Computed age of the passenger.

### Trip
Contains details of each railway trip:
- **ID**: Unique trip identifier.
- **Train_Number**: Train identification number.
- **Train_type**: Type or class of the train.
- **Leaving_time**: Departure time.
- **Arrival_time**: Arrival time.
- **Trip_duration**: Duration of the journey.

### Station
Represents railway stations:
- **ID**: Unique station identifier.
- **Name**: Station name.
- **Location**: Geographical location.
- Stations are linked to trips through an "Includes" relationship.

### Ticket
Stores booking details:
- **ID**: Unique ticket number.
- **Arrival_station** & **Departure_station**: Travel route.
- **Trip_date**: Date of travel.
- **Seat_number**: Assigned seat number.
- **Class**: Ticket category (e.g., Economy, Business).
- **Price**: Ticket cost.
- **Booking_date**: Date when the ticket was booked.
- **Pay_method**: Payment method (e.g., Credit Card, Online Payment).

### Cancellation
Manages ticket cancellations:
- **Cancellation_date**: The date when a ticket was canceled.
- Linked to both passengers and their respective booked tickets.

## Relationships
- Each **Passenger** can book multiple **Tickets**, but a ticket belongs to only one passenger.
- A **Ticket** is associated with a specific **Trip**.
- A **Trip** consists of multiple **Stations**.
- A **Passenger** can cancel a ticket, but cancellation is optional.

## Usage
- Passengers can book and manage tickets online.
- Admins can update station details, trip schedules, and passenger information.
- The system supports ticket cancellations and modifications.


