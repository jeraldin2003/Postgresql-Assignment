-- https://dbdiagram.io/d

Table users {
   user_id	SERIAL	[PRIMARY KEY]
  name	VARCHAR(100)	[NOT NULL]
  email	VARCHAR(100)	[UNIQUE, NOT NULL]
  phone	VARCHAR(15)	
  address	TEXT	
}
Table products{
  product_id	SERIAL [PRIMARY KEY]
  product_name	VARCHAR(100) [NOT NULL]
  description	TEXT	
  price	DECIMAL(10,2)	[NOT NULL]
  stock	INT

}
Table orders {
  order_id	SERIAL	[PRIMARY KEY]
  user_id	INT	[ref: > users.user_id, not null]
  order_date	TIMESTAMP 
  total_amount	DECIMAL(10,2)	[NOT NULL]
}

Table order_items{
  order_item_id	SERIAL	[PRIMARY KEY]
  order_id	INT	[ref: > orders.order_id]
  product_id	INT	[ref: > products.product_id]
  quantity	INT	[NOT NULL]
  price	DECIMAL(10,2)	[NOT NULL]
}
