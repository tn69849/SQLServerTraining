-- Module 2 Exercise 3

-- Task 1 - Create a user through SSMS

-- Task 2 - Create a database role through SSMS

-- Task 3 - Create a user through Transact-SQL
-- Execute the following code to create the internetsales_manager user
USE salesapp1;
GO
CREATE USER internetsales_manager FOR LOGIN [ADVENTUREWORKS\InternetSales_Managers] 
GO

-- Task 4 - Create database roles
-- write a query to create two user-defined database roles, called:
--  - production_reader
--  - sales_order_writer
CREATE ROLE production_reader;
CREATE ROLE sales_order_writer;
GO

-- Task 5 - Grant permissions
-- Write a query to grant SELECT permissions on the Production schema to the production_reader role.
-- Write a query to grant UPDATE permissions on the Sales.Orders table 
-- and the Sales.OrderDetails table to the sales_order_writer role.
GRANT SELECT ON SCHEMA::Production TO production_reader;
GO
GRANT UPDATE ON Sales.OrderDetails TO sales_order_writer;
GO
GRANT UPDATE ON Sales.Orders TO sales_order_writer;
GO

-- Task 6 - Add members
-- edit the query to make the internetsales_manager 
-- user a member of the sales_reader, sales_order_writer, and production_reader roles.
ALTER ROLE sales_reader ADD MEMBER internetsales_manager; 
ALTER ROLE production_reader ADD MEMBER internetsales_manager;
ALTER ROLE sales_order_writer ADD MEMBER internetsales_manager;
GO
