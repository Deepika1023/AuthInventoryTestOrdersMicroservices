CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE DATABASE order_db;
-- connect: \c order_db
CREATE TABLE orders (order_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), user_id UUID NOT NULL, order_status VARCHAR(30) NOT NULL CHECK(order_status IN ('CREATED','CONFIRMED','CANCELLED')), created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE order_items (order_item_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), order_id UUID NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE, product_id UUID NOT NULL, quantity INT NOT NULL CHECK(quantity>0));
CREATE INDEX idx_orders_user_id ON orders(user_id);
