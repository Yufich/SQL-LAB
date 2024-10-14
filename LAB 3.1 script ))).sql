CREATE TABLE IF NOT EXISTS invoice ( 
  invoice_id BIGINT(15) NOT NULL, 
  employee_id INT NOT NULL, 
  customer_id INT, 
  payment_method INT NOT NULL, 
  transaction_moment DATETIME NOT NULL,
  status VARCHAR(10) NOT NULL
  );
  ALTER TABLE 
  orders 
  ADD 
  invoice_id BIGINT(15) NOT NULL;
  
  --/*короче, проблема в тому, що в нових версіях mysql вже не використовуються значення ширини для INT, BIGINT, зараз перевіряю, благо, якщо так і є */
  
 SHOW WARNINGS;
 
  ALTER TABLE 
  orders 
  ADD 
  invoice_id BIGINT(15) NOT NULL;
  
  ALTER TABLE 
  orders 
  MODIFY 
  invoice_id BIGINT NOT NULL; --/*пішла штука, справа була в значеннях ширини ))))*/
  --/**/
DESCRIBE orders;

ALTER TABLE 
orders 
ADD 
order_datetime DATETIME NOT NULL; 

ALTER TABLE 
orders 
ADD
quantity INT NOT NULL;

ALTER TABLE 
orders 
DROP COLUMN
transaction_type; 

ALTER TABLE 
orders 
DROP COLUMN
transaction_moment;

ALTER TABLE 
orders 
DROP COLUMN
amount; 

ALTER TABLE 
customer 
MODIFY 
phone_number
BIGINT NOT NULL;

ALTER TABLE 
employee
MODIFY 
position varchar(30) NOT NULL;

ALTER TABLE 
department
MODIFY
street varchar(50) NOT NULL;

ALTER TABLE 
department 
MODIFY 
building_no INT; 

ALTER TABLE 
invoice
ADD PRIMARY KEY (invoice_id); 

--/*ну, якщо вже є первинний ключ, то чому не має бути автоінкремента ))*/
ALTER TABLE 
invoice 
MODIFY 
invoice_id BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE 
orders 
DROP FOREIGN KEY orders_fk1; 

ALTER TABLE 
orders 
DROP FOREIGN KEY orders_fk3; 

ALTER TABLE 
orders 
ADD CONSTRAINT 
orders_fk0
FOREIGN KEY 
(invoice_id)
REFERENCES
invoice(invoice_id);

ALTER TABLE 
invoice 
ADD CONSTRAINT
invoice_fk0
FOREIGN KEY 
(employee_id) 
REFERENCES 
employee(employee_id);

ALTER TABLE 
department 
ALTER 
city 
SET DEFAULT 
'Lviv'; 

ALTER TABLE 
employee 
ADD UNIQUE 
(user_name);

--/*поки усьо :) */
--/*та, бачу зв^язок з кастомерами то жарт, виправляю */

ALTER TABLE 
invoice 
ADD CONSTRAINT
invoice_fk1
FOREIGN KEY 
(customer_id) 
REFERENCES 
customer(customer_id); 

--/*гуд*/
--/*бачу те, що слід виправити*/

ALTER TABLE 
employee
MODIFY
first_name varchar(30); --/*був тип інт*/

ALTER TABLE 
orders 
DROP 
INDEX 
orders_fk1;

ALTER TABLE 
orders 
DROP 
INDEX 
orders_fk3;

ALTER TABLE 
customer 
MODIFY
birth_date DATE; 

--/*по всьому?*/


ALTER TABLE 
orders 
DROP CONSTRAINT orders_fk0;

ALTER TABLE 
orders 
ADD CONSTRAINT 
orders_fk0
FOREIGN KEY 
(invoice_id)
REFERENCES
invoice(invoice_id);

ALTER TABLE 
orders 
DROP COLUMN 
employee_id;

ALTER TABLE 
orders 
DROP COLUMN 
customer_id;

--/*done*/











