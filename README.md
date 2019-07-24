# TICKETEVENT

A simple application for creating events (e.g. concerts) and purchasing tickets for said events.


## Installation:

Firstly, you'd need to clone the repo:

```bash
# Clone this repository
$ git clone https://github.com/Tommy5230/ticketevent

# Change the directory you're in:
$ cd ticketevent

# Install all dependencies:
$ bundle install
```


## Database setup:


```bash
# Enter postgres:
$ sudo -i -u postgres psql

# Create a database:
create database "ticketevent_development" owner 'ticketevent';

```


## Starting the app:

Run the app from bash:

```bash
# Run the app:
$ rails s
```
Open web browser, and type the following address:
```bash
localhost:3000
```


## Usage:

The majority of app features is available without being logged in. Although in order to use all of them you'd need to register (input data is being stored in **ticketevent_development** database in **users** table) and log in.

Now you can create an event (**events** table in **ticketevent_development** database). Once an event is created you can create a ticket for it (**tickets** table). Created ticket is available for a purchase.

Purchases are recorded in a joined table between Ticket and User models.

**TL&DR:**
<br>
Only a logged in user can purchase a ticket.


## List of buttons and what they do (HTTP actions):

**REGISTER** - HTTP: GET /auth/sign_up

**SIGN UP** - HTTP: POST (create input in **users** table)

**LOGIN** - HTTP: GET /auth/login

**LOG IN** - HTTP: POST (create input in **users** table)

**EVENTS** - HTTP: GET /events

* *Show* - HTTP: GET /events/id

  * *Proceed to buy* - HTTP: GET /tickets/id


* *Edit* - HTTP: GET /events/id/edit

* *Update Event* - HTTP: PATCH /events/id (modify input in **events** table)

* *Destroy* - HTTP: DELETE /events/id (delete record from **events** table)

**NEW EVENT** - HTTP: GET /events/new

**CREATE EVENT** - HTTP: POST (create input in **events** table)

**TICKETS** - HTTP: GET /tickets

* *Show* - HTTP: GET /tickets/id

  * *Buy* - HTTP: POST /tickets/id/purchases


* *Edit* - HTTP: GET /tickets/id/edit

* *Update Ticket* - HTTP: PATCH /tickets/id (modify input in **tickets** table)

* *Destroy* - HTTP: DELETE /tickets/id (delete record from **tickets** table)

**NEW TICKET** - HTTP: GET /tickets/new

**CREATE TICKET** - HTTP: POST (create input in **tickets** table)


## To do:

* Introduce **admin** role, and add authentications for CRUD-actions related to events and tickets (**user** should be able to browse through events and available tickets only).


## Known issues:

* When purchasing a ticket (clicking **"Buy"** button for the first time for a given ticket), following error is being thrown:
```bash
ActionController::InvalidAuthenticityToken
```
After clicking **"Previous page"** in your web browser, and clicking **"Buy"** once again, it works (ticket is purchased successfully).

* The listing on **events#show**, and number of available tickets in **events#index** show the total amount of tickets created for that event

* Unable to create test db (ActiveRecord::StatementInvalid: PG::InsufficientPrivilege)
