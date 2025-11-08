# 🛒 Zepto Product Data Analysis (SQL)

This project focuses on exploring and cleaning **Zepto product data** using SQL.  
It includes operations like data validation, cleaning, and generating insights on pricing, stock, and product categories.

## 📘 Overview
The dataset contains product details such as **category, name, price, discount, stock status, and weight**.  
SQL queries were written to:
- Clean invalid or missing data  
- Identify duplicate or zero-priced products  
- Analyze discounts, categories, and revenue potential  

## 🧮 Key SQL Operations
- **Data Validation:** Checked for null values across columns  
- **Duplicate Detection:** Found products listed multiple times  
- **Data Cleaning:** Removed records with zero MRP and scaled prices to rupees  
- **Exploratory Queries:** Extracted unique categories and stock summaries  

## 📊 Insights Generated
-  **Top 10 Best-Value Products:** Highest discount percentages  
-  **Out-of-Stock Premiums:** High-MRP items currently unavailable  
-  **Category Revenue Estimation:** Potential earnings by category  
-  **Price per Gram Analysis:** Value-for-money products by weight  
-  **Weight-Based Classification:** Grouped as Low, Medium, or Bulk  
-  **Inventory Weight Summary:** Total stock weight per category  

## ⚙️ Usage
1. Run the SQL script in **PostgreSQL** or any compatible database.  
2. Execute queries sequentially to:
   - Create the table  
   - Load data  
   - Perform cleaning and analysis  

## 📈 Author
**Parth Inamdar**  
https://www.linkedin.com/in/parthinamdar/
