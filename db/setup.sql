DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id bigserial PRIMARY KEY,
  name varchar(255) NOT NULL,
  price_cents bigint NOT NULL
);

INSERT INTO products (name, price_cents) VALUES ('Fender Stratocaster', 999900), ('Gibson Les Paul', 499900);
