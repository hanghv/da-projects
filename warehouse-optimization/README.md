# MINT CLASSICS WAREHOUSE OPTIMIZATION CASE STUDY USING MySQL
## 1. Project Overview
Mint Classics is a retailer of classic model cars and other vehicles. They are looking at closing one of the warehouses while still maintaining timely service to their customers. This project analyzes inventory as well as product and order data in order to provide data-driven recommendations to support warehouse consolidation.
## 2. Brainstorming
1. What decision need to be made?: Closing one of the warehouses
2. To know which one to close, we need to know the value of each warehouse. The one with lowest value has to go
3. Value of the warehouse comes from:
- Warehouse capacity and current occupy rate => need products and warehouses tables
- Value of the products stored: high value = top-selling or big gap between price and cost => need products and orderdetails table
- Distance to customers => need data about warehouse and customer locations. In the database, there is no information about where the warehouses are located, so it is unable to find the common point between customer's city and warehouses
## 3. Business questions
- What is current status of each warehouse?
- Which are low-performance products?
- Which warehouse has the highest rate of low-performance stock?
## 4. Dataset
- Database: mintclassics
- Tables used:
  - products
  - warehouses
  - orderdetails
## 5. Findings
### Warehouse overview
