# Library Room Booking System #

----------
### This is an online booking system for library rooms, users are composed of super admin, admin and member. They have different priviledge accordingly.###

## Admin Account and password ##
The super admin:

Account: admin@123.com
Password: 111111

## Deployment ##
URL:
https://librarybookingsystem.herokuapp.com

## Users and authorization##
1.Users' roles. 
There is a preconfigured Admin which can not be modified or deleted(It is created at the first registration). The account is "admin@123.com" with a password "111111". Other users are either admins or members. Admins can be created or deleted by other admins but can not deleted self account. Anyone can register to be a member and use the booking function.

2.admins
Admins' responsibility is manage users, bookings and rooms. After one admin sign in, it will redirect to the homepage. In homepage listed the main functions of an admin:

Edit Profile

Manage Users

Manage Rooms

Manage Reservation

(1)Edit Profile

modify self profiles, including one's email, username and password.

(2)Manage Users

There are tabs on the top of this page with witch can switch between managing members and managing admins. Admin acount creation link is on the top of admin managing page. In the body, listing the users' information. An admin can delete other users' account exept the super admin's and self account. An admin can view profiles and booking history of users and admins.

(3)Manage Rooms

An admin can manage rooms, including creating a new room, modify existing rooms and delete existing rooms. 

(4)Manage reservations

An admin can view booking schedule, modify existing bookings and create new bookings for any members even a member has a booking at the same time.

3.Members

Users can register for a new member account. After signing in, it will redirect to members' homepage, functions on teh homepage are listed below:

(1)Edit Profile: edit his/her own profile.

(2)Reserve a room: reserve a room if it is available. A user can not book another room at the same time.

(3)My schedule: view his/her own schedule, change schedule or release a room.

(4)Rooms: view rooms information and schedule.

(5)Reservation history: view his/her own booking history.

(6)Search rooms: search rooms based on the room number, room status (available or booked), building and room size.

##Attention##


1.In the "/rooms/(room id)" page, the adimin can change everything except status, member can only view.

2.If the reservation expired, it will not show in the calendar of "/rooms/(room id)/appoints" page.

3.The calendar in "/rooms/(room id)/appoints" page will only show the bookings within one week. The calendar will show one week's booking, days in the following week will show in the next calendar. Just click next on the calendar, you will see next week's bookings.

4.All users could only make an booking from now and up to one week.

5.In the "/rooms" page, the status info shows the usage infomation of the room at the current time. If the room is currently in use, it will shows "Booked", vise versa. If the room is booked and the current reservation is deleted, the room status will be updated automatically from "Booked" to "Available".

6.The booking time be one hour and two hours, and the start time can be any specific time if the room is available.User can only delete the booking made by themselves. Also the room will be released automatically, when the booking time is over.

7.If a user book the room for a invalid date, such as "September 31st", the system will automatically search for the next valid date, for this case is "October 1st".

8.When create library room, the library room name should be unique in the same library but you can have two room with same name from different libraries. (1001 can be both the name for a room in Hunt and a room in Hill).

##Bonus ##

A library member can reserve only one room at a particular date and time. Only after his/her reservation is released/deleted, he/she can proceed to reserve another room.
