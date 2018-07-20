DROP TABLE IF EXISTS line_items;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE products (
  id bigserial PRIMARY KEY,
  name varchar(255) NOT NULL,
  price_cents bigint NOT NULL,
  CONSTRAINT name_unique UNIQUE(name)
);

CREATE TABLE customers (
  id bigserial PRIMARY KEY,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  CONSTRAINT email_unique UNIQUE(email)
);

CREATE TABLE sales (
  id bigserial PRIMARY KEY,
  customer_id bigint references customers(id) NOT NULL,
  created_at timestamp NOT NULL
);

CREATE TABLE line_items (
  id bigserial PRIMARY KEY,
  sale_id bigint references sales(id) NOT NULL,
  product_id bigint references products(id) NOT NULL,
  quantity bigint NOT NULL
);

INSERT INTO products (name, price_cents)
  VALUES ('Fender Stratocaster', 999900),
         ('Fender Telecaster', 139999),
         ('Gibson Les Paul', 499900),
         ('Gibson SG', 73900),
         ('Fender Standard Precision Bass', 59999),
         ('Fender American Elite Jazz Bass', 199999);
