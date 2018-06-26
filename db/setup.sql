DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id bigserial PRIMARY KEY,
  name varchar(255) NOT NULL,
  price_cents bigint NOT NULL
);

INSERT INTO products (name, price_cents)
  VALUES ('Fender Stratocaster', 999900),
         ('Fender Telecaster', 139999),
         ('Gibson Les Paul', 499900),
         ('Gibson SG', 73900),
         ('Fender Standard Precision Bass', 59999),
         ('Fender American Elite Jazz Bass', 199999);
