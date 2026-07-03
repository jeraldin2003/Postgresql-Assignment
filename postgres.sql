Create table Users (
     user_id Serial Primary Key,
     name Varchar(100) Not Null,
     email Varchar(100) Unique Not Null,
     phone Varchar(15),
     address Text
 );
 Create Table Products (
     product_id Serial Primary Key,
     product_name Varchar(100) Not Null,
     description Text,
     price Decimal(10,2) Not Null,
     stock Int DEFAULT 0
 );
Create Table Orders (
     order_id Serial Primary Key,
     user_id Int Not Null,
     order_date Timestamp default CURRENT_TIMESTAMP,
     total_amount Decimal(10,2) Not Null,

     FOREIGN KEY (user_id)
     REFERENCES Users(user_id)
 );
Create Table Order_Items (
     order_item_id Serial Primary Key,
     order_id Int Not Null,
     product_id Int Not Null,
     quantity Int Not Null,
     price Decimal(10,2) Not Null,
     FOREIGN KEY (order_id)
     REFERENCES Orders(order_id),
     FOREIGN KEY (product_id)
     REFERENCES Products(product_id)
 );
Insert Queries
 Insert into users (user_id, name, email, phone, address) values(

    1, 'John Doe', 'john@gmail.com', '1234567890', 'Noida Sec 142'
 );
 Insert into users (user_id, name, email, phone, address) values(

    2, 'John', 'john1@gmail.com', '1234566890', 'Noida Sec 141'
 );

 Insert into products (product_id, product_name, description, price, stock) values(

    1, 'Laptop', 'Dell laptop', 1000.00, 10
 );

 Insert into products (product_id, product_name, description, price, stock) values(

    2, 'Phone', 'Dell phone', 500.00, 20
 );
 Insert into products (product_id, product_name, description, price, stock) values(

    3, 'Car', 'Dell car', 1000.00, 10
 );


Insert into orders (order_id, user_id, order_date, total_amount) values(

    1, 1, '2023-01-01 10:00:00', 1500.00
 );

 Insert into orders (order_id, user_id, order_date, total_amount) values(

    2, 2, '2023-01-02 11:00:00', 500.00
 );

 Insert into order_items (order_item_id, order_id, product_id, quantity, price) values(

    1, 1, 1, 1, 1000.00
 );

 Insert into order_items (order_item_id, order_id, product_id, quantity, price) values(
    2, 1, 2, 1, 500.00
 );

 Insert into order_items (order_item_id, order_id, product_id, quantity, price) values(
    3, 2, 2, 1, 500.00
 );

Join Queries
Lists all orders with customer name
Select
   o.order_id,
   u.name AS customer_name,
   o.order_date,
   o.total_amount
From Orders o
Join Users u
On o.user_id = u.user_id;
Lists all products in every order
Select
   o.order_id,
   p.product_name,
   oi.quantity,
   oi.price
From Order_Items oi
Join Orders o
On oi.order_id = o.order_id
Join Products p
On oi.product_id = p.product_id
Order By o.order_id;
shows total orders placed by each customers
Select
   u.user_id,
   u.name,
   COUNT(o.order_id) AS total_orders
From Users u
Left Join Orders o
On u.user_id = o.user_id
Group By
   u.user_id,
   u.name
Order By total_orders desc;