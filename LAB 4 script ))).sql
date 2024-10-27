--/*Завдання перше: потрібно було вивести всі дані з таблиці кастомер відсортувавши їх за прізвищем*/
SELECT 
*
FROM 
customer
ORDER BY
last_name ASC;

--/*Завдання друге: потрібно було вивести унікальні назви виробників (manufacture) з таблиці продуктів, впорядкувати за алфавітом*/
SELECT DISTINCT 
manufacture 
FROM 
product
ORDER BY 
manufacture ASC;
--/*все пішло, значення унікальні та відсортовані*/ 

--/*Завдання третє: потрібно отримати інф. про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна),
вироблені компанією 'DELL', з таблиці продуктів, впорядкувати за назвою продукту в алфавітному порядку.*/
SELECT 
product_name,
manufacture, 
product_type,
price 
FROM 
product
WHERE 
manufacture = 'DELL'
ORDER BY 
product_name ASC;

--/*Завдання четверте: потрібно отримати інф. про клієнтів-жінок 1990-2000 років народження (ім^я, прізвище, стать, дата
народження, номер телефону) з таблиці customer в одному запиті, відсортовану за прізвищем в
алфавітному порядку.*/ 
SELECT 
first_name, 
last_name, 
gender, 
birth_date,
phone_number 
FROM 
customer 
WHERE 
gender = 'F'
AND 
birth_date 
BETWEEN 
'1990-01-01'
AND 
'2000-12-31'
ORDER BY 
last_name ASC; 
--/*все добре*/

--/*Завдання п^яте: потрібно отримати інф. з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими
накопичувачами об^ємом 512 ГБ.*/
SELECT 
* 
FROM 
product 
WHERE
category = 'NOTEBOOK' 
AND
product_description 
LIKE 
'%512GB%'
ORDER BY 
product_name ASC; 

--/*Завдання шосте: потрібно отримати інф. з таблиці товарів про наявні на складі ноутбуки або настільні комп^ютери, які
оснащені дисковими накопичувачами 512 ГБ або 1 ТБ.*/
SELECT 
* 
FROM 
product 
WHERE 
category = 'NOTEBOOK'
OR 
category LIKE 'D%'
AND 
product_description 
LIKE 
'%512GB SSD%'
OR
'%1TB SSD%'
ORDER BY 
category ASC; 
--/*поки рухаюся далі, але тут помилка, тому що виводиться сімнадцять рядків.
 Справа в тому, що моделі НР не мають заданих обмежень, але всеодно виводяться, вирішую цю проблему*/
 
SELECT 
* 
FROM 
product 
WHERE 
category = 'NOTEBOOK'
OR 
category LIKE 'D%'
AND 
product_description 
LIKE 
'%512GB SSD%'
OR
'%1TB SSD%'
AND 
NOT product_description 
LIKE 
'%500GB%'
OR
'%256GB%'
ORDER BY 
category ASC; 
--/*думала, що задавши інше обмеження зможу запобігти виведенню некоректних даних, але ні, НР всеодно залишається присутнім в поточній таблиці, 
тому, якщо хтось раптом це читає і знає, що можна домалювати, напишіть мені*/

--/*ще такий варіант*/
SELECT 
* 
FROM 
product 
WHERE 
category = 'NOTEBOOK'
OR 
category LIKE 'D%'
AND 
product_description 
LIKE 
'%512GB SSD%'
OR
'%1TB SSD%'
AND 
NOT product_description 
NOT LIKE 
'%512GB SSD%'
OR
'%1TB SSD%'
ORDER BY 
category ASC; 
--/*не працює*/

--/*Завдання сьоме: потрібно отримати інф. з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими
покупцями (customer_id NULL).*/
SELECT 
* 
FROM 
invoice 
WHERE 
customer_id 
IS NULL; 













