/*Відобразити список усіх замовлених найменувань товарів разом з іменами та прізвищами клієнтів і моментом
проведення транзакції по інвойсу. Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID.
Застосувати різні методи запитів з кількох таблиць. Перелік полів: (orders.orders_id AS 'Orders ID',
product.product_name AS 'Product name',product.category AS 'Product category',invoice.invoice_id AS 'Invoice
ID',invoice.transaction_moment AS 'Transaction moment',customer.last_name AS 'Customer last
name',customer.first_name AS 'Customer first name’)*/

SELECT 
o.orders_id 'Orders ID',
p.product_name 'Product name',
p.category 'Product category',
i.invoice_id 'Invoice ID',
i.transaction_moment 'Transaction moment',
c.last_name 'Customer last name',
c.first_name 'Customer first name'
FROM 
orders o 
JOIN 
product p ON o.product_id = p.product_id
JOIN 
invoice i ON o.invoice_id = i.invoice_id
JOIN 
customer c ON i.customer_id = c.customer_id
ORDER BY 
o.orders_id;
/*жесть.*/

/*Відобразити імена співробітників, які працюють у відділі "Меркурій", і список всіх товарів, замовлених з '2023-07-
01' по '2023-10-01’. Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID. Перелік полів:
(orders.orders_id AS 'Orders ID', product.product_name AS 'Product name',product.category AS 'Product
category',invoice.invoice_id AS 'Invoice ID',invoice.transaction_moment AS 'Transaction moment',customer.last_name
AS 'Customer last name',customer.first_name AS 'Customer first name’)*/

SELECT 
o.orders_id 'Orders ID',
p.product_name 'Product name',
p.category 'Product category',
i.invoice_id 'Invoice ID',
i.transaction_moment 'Transaction moment',
c.last_name 'Customer last name',
c.first_name 'Customer first name',
e.employee_id 'Employee ID',
e.first_name 'Employee name', 
e.last_name 'Employee surname', 
d.department_name 'Department name' 
FROM 
orders o
JOIN 
product p ON o.product_id = p.product_id
JOIN 
invoice i ON o.invoice_id = i.invoice_id
JOIN 
customer c ON i.customer_id = c.customer_id
JOIN 
employee e ON i.employee_id = e.employee_id
JOIN 
department d ON e.department_id = d.department_id
WHERE 
d.department_name = 'Mercury'
AND 
i.transaction_moment 
BETWEEN 
'2023-07-01' 
AND
'2023-10-01'
ORDER BY 
o.orders_id;

/*все працює, айдішка для емплої, певне, необов'язкова, але я додала, 
можна було юзати правий чи лівий джойн, але в даному випадку таблиця, 
що виводиться не змінюється, я перевіряла, тому вони необов'язкові*/

/*Показати імена та прізвища всіх клієнтів з таблиці клієнтів, а також клієнтів без замовлень і замовлень без клієнтів
(якщо такі є). Будь ласка, відсортуйте дані за ID інвойсу.Перелік полів: (c.customer_id AS 'Customer ID',
c.last_name AS 'Last Name', c.first_name AS 'First Name', i.invoice_id AS 'Invoice ID', i.transaction_moment AS
'Transaction Moment')*/

-- SELECT * FROM (
SELECT 
c.customer_id 'Customer ID',
c.last_name 'Last Name',
c.first_name 'First Name',
i.invoice_id 'Invoice ID',
i.transaction_moment 'Transaction Moment'
FROM
customer c
RIGHT JOIN 
invoice i
ON 
c.customer_id = i.customer_id
UNION ALL
SELECT 
c.customer_id 'Customer ID',
c.last_name 'Last Name',
c.first_name 'First Name',
i.invoice_id 'Invoice ID',
i.transaction_moment 'Transaction Moment'
FROM
invoice i
RIGHT JOIN 
customer c
ON 
i.customer_id = c.customer_id
-- ) AS RESULT 
ORDER BY 
`Invoice ID`; -- виправлено

/*все б нічого, і наче працює, але проблема в сортуванні по інвойсу, тому що коли використовую i.invoice_id, 
то вибиває помилку, а коли використовую 'Invoice ID' то нічого не сортується, що одне, що інше - проблема
Так, пояснюю, сортування по i.invoice_id не відбувається через те, що використовується UNION, наскільки я розумію, то він робить так, 
що еліаси недоступні для зовнішнього запиту, чому, поки-шо не розумію. 
Далі, щоб відсортувати по Invoice ID потрібно використовувати скошені одинарні лапки, якщо використовувати прямі одинарні, 
то SQL сприймає це, як текст, а не як значення колонки*/













