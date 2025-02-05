SELECT TOP (1000) [Order_ID]
      ,[Amount]
      ,[Profit]
      ,[Quantity]
      ,[Category]
      ,[Sub_Category]
  FROM [SQL-Project].[dbo].[Order Details]


 -- How much profit comes from each product category?

 select Category , sum(Profit) as Total_Profit 
 from [SQL-Project].[dbo].[Order Details]
 group by Category
 order by Category desc

 -- How much has each customer spent in total?

 select b.CustomerName, sum(a.Amount) as Customer_spent
 from [SQL-Project].[dbo].[Order Details] a
 inner join [SQL-Project].[dbo].[List of Orders] b
 on a.Order_ID = b.Order_ID
 group by b.CustomerName
 order by Customer_spent desc

 --  How many products were sold in each state?
 select b.State , sum(a.Quantity) as Product_Solds
from [SQL-Project].[dbo].[Order Details] a
inner join [SQL-Project].[dbo].[List of Orders] b
on a.Order_ID = b.Order_ID
group by State 
order by Product_Solds desc

--What is the average profit made on each sub-category of products?

select  Sub_Category, avg(Profit) as Avg_Profit 
from [SQL-Project].[dbo].[Order Details] 
group by Sub_Category
order by Avg_Profit desc

--  What's the total spending in each city, broken down by state?