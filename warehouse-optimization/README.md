# MINT CLASSICS WAREHOUSE OPTIMIZATION CASE STUDY USING MySQL
## 1. Project Overview
Mint Classics is a retailer of classic model cars and other vehicles. They are looking at closing one of the warehouses while still maintaining timely service to their customers. This project analyzes inventory as well as product and order data using mySQL to evaluate:
- warehouse capacity
- product sales performance
- inventory quality
This helps provide data-driven recommendations to support warehouse consolidation.
## 2. Analytical Thinking
To determine which warehouse should be closed, I first identified the factors that contributes to a warehouse's business value.
Business value of a warehouse comes from:
- Warehouse capacity and utilization
  - What is the maximum capacity of each warehouse?
  - Can a warehouse's inventory be redistributed to other warehouses?
- Inventory value
  - Does the warehouse store top-selling products?
  - Are the products generating big sales and profit margins?
- Customer accessibility
  Ideally, warehouse locations should be analyzed against customer locations to estimate the impact on delivery time. However, this analysis was not possible because the dataset does not include warehouse location information.
## 3. Business questions
These questions are structured to evaluate warehouse performance from three perspectives: current state, operational efficiency, and decision feasibility.
- What is current utilization and maximum capacity of each warehouse?
- Which warehouse has the highest rate of low-performance products and inventory?
- Can the inventory from the eliminated warehouse be redistributed without exceeding remaining warehouse capacities?
## 4. Dataset
- Database: mintclassics
- Tables used:
  - products
  - warehouses
  - orderdetails
## 5. Findings
### Warehouse overview
<img width="588" height="130" alt="warehouse-overview" src="https://github.com/user-attachments/assets/bf20509e-283c-4aa5-b6c3-b9849ce8332b" />
Assuming similar storage requirements across products, North and South warehouses are the smallest, with maximum capacities of 182,900 and 105,804 units respectively. The combined inventory of North and South warehouses (~221,000 units) can be fully accommodated by East and West warehouses, which have a combined capacity of approximately 232,000 units.

### Percentage of low-performance product and stock in each warehouse
<img width="1250" height="122" alt="p5tG7GivRszE" src="https://github.com/user-attachments/assets/43a397af-016d-4f8a-af46-68b1abc070e3" />
Overall, all warehouses have more than 30% low-performing products, defined as products with below-average sales volume and unit profit margin.
Among them, Warehouse South has the highest proportion of low-performing products (43%), based on 10 out of 23 products performing below average.
In terms of inventory quality, Warehouse West has the lowest proportion of low-performing stock (29.59%), while Warehouse South has the highest (46.69%).
These findings indicate that Warehouse South has lower operational efficiency compared to the other warehouses.

## 6. Recommendations
Based on inventory performance and warehouse efficiency, Warehouse South is the strongest candidate for closure.
It has the highest proportion of low-performing products (43%) and the lowest overall inventory quality (46.69% low-performing stock). Additionally, its total inventory (~79,380 units) can be fully redistributed to the remaining warehouses without exceeding their combined capacity.
Closing Warehouse South would improve overall warehouse efficiency while maintaining operational feasibility.
