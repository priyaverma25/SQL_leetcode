# Recclable and low fat products
select product-id
from products
where low_fat = 'Y' and recyclable = 'Y'
 
# Not Boring Movies 
select * from cinema
where id % 2 != 0
and description != 'boring'
order by rating  desc

# Find Customer Referee
select name
from customers
where referee_id !=2
or referee_id is null 
 
-- Customer Placing the Largest Number of Orders
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(order_number) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_number) AS order_count
        FROM Orders
        GROUP BY customer_number
    ) AS temp
);


Classes With at Least 5 Students

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;


-- -- Monthly Transactions I
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

-- User Activity for the Past 30 Days I
SELECT
  activity_date AS day,
  COUNT(DISTINCT user-id) AS active_users,
FROM Activity
WHERE
  activity_date >= '2019-06-28' AND activity_date <= '2019-07-27'
GROUP BY activity_date  
