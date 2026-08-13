CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE DATABASE inventory_db;
-- connect: \c inventory_db
CREATE TABLE products (product_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), product_name VARCHAR(150) NOT NULL, stock_qty INT NOT NULL CHECK(stock_qty>=0), is_active BOOLEAN NOT NULL DEFAULT TRUE, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP);
CREATE INDEX idx_products_name ON products(product_name);
