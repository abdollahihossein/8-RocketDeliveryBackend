# RocketDeliveryBackend
This is the project for 11th week in CodeBoxx.

* Ruby version: 3.1.2

* Rails version: 7.0.4.3

* sqlite3 version: 3.37.2

* System dependencies: devise

* usefull commands:
rails new myproject
rails s  ---> http://localhost:3000
rails g controller posts show
rails g model post title:string body:text
rails db:migrate
rails db:seed
rails db:drop db:create db:migrate
rails routes
rails g scaffold person firstname:string lastname age:integer active:boolean height:decimal
rails destroy scaffold person
rails db:reset
-------------------------------------------------------------------------------------------------------------------
What is SQL?

Structured query language (SQL) is a programming language for storing and processing information in a relational database. A relational database stores information in tabular form, with rows and columns representing different data attributes and the various relationships between the data values. You can use SQL statements to store, update, remove, search, and retrieve information from the database. You can also use SQL to maintain and optimize database performance.
-------------------------------------------------------------------------------------------------------------------
What is the main difference between SQLite and MySQL?

SQLite is a server-less database and is self-contained. This is also referred to as an embedded database which means the DB engine runs as a part of the app. On the other hand, MySQL requires a server to run. MySQL will require a client and server architecture to interact over a network.
-------------------------------------------------------------------------------------------------------------------
What are Primary and Foreign Key? Give an example for each

The PRIMARY KEY constraint uniquely identifies each record in a table. Primary keys must contain UNIQUE values, and cannot contain NULL values. Vehicle Identification Number (VIN) is an example of primary key.

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table. For example, a table called TEAM may have an attribute, MEMBER_NAME, which is a foreign key referencing a candidate key, PERSON_NAME, in the PERSON table.
-------------------------------------------------------------------------------------------------------------------
What are the different relationship types that can be found in a relational database? Give an example for each type.

There are 3 main types of relationship in a database: one-to-one. one-to-many. many-to-many.

one-to-one: 
A One-to-one relationship means a single record in Table A is related to the single record in Table B and vice-versa.
For example, If there are two entities, 'Person'(Name, age, address, contact no.) and 'Health card'(Name, Health no.). So each person can have only one Health card, and the single Health card belongs to only one person.

one-to-many:
A one-to-many relationship is defined as when a single record in the first table is related to one or more records in the other table, but a single record in the other table is related to only one record in the first table.
For example, if there are two entities, 'Customer' and 'Account', then each customer can have more than one account, and also, each account is owned by one customer only.

many-to-many:
A many-to-many relationship can be defined as when a single record in the first table is related to one or more products in the second table and a single record in the second table is related to one or more records in the first table.
For example, consider the two tables i.e., a student table and a courses table. A particular student may enroll himself in one or more than one course, while a course also may have one or more students. Hence, this is a great example of many-to-many relationships.
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
Identify a pair of tables that have a many-to-one relationship:
(employees & addresses) : Every employee lives in one address but it's possible that one address belongs to more than one employee. For example two employees which are brother live in same address.

Identify a pair of tables that have a one-to-one relationship:
(users & employees) : Every user can be only one employee and vice versa.

Identify a many-to-many relationship in the diagram:
There is no many-to-many relation in the diagram!