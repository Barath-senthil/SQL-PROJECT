create	schema pre_final_test

-- use pre_final_test 

1
select * from students 
where age > 20 order by 
age desc

2
select distinct city from customers

3
select * from employees order by
salary desc limit 3

4
select * from employees where salary 
between 40000 and 90000
order by salary asc

5
select dept_name,sum(salary) as dept_salary
from departments left join 
employees using (id) 
group by dept_name
having dept_salary > 50000

6 
select * from customers where 
customer_name like 'A%a'

7
select * from products
where not category = 'electronics' 

8
select * from employees 
where bonus is null or bonus = ''

9
select * from orders 
where order_date like '2024-01%'
order by order_date desc 

10
select * from students 
where not age between 18 and 22

11
select *,
case
when salary between 60000 and 90000 then 'senior staff'
when salary between 30000 and 59000 then 'mid staff'
when salary between 10000 and 29000 then 'junior staff'
else 'NEW JOIN'
end emp_catogary
from employees

12
select city,count(id) as member_count 
from students group by city

13
select dept_name,sum(salary) as dpt_salary from 
employees as e left join departments as d
on e.dept_id = d.id group by dept_name
order by dpt_salary desc

14
select * from students limit 3,5

15
select * from customers 
where email = ''

16
select concat(id,' . ',name) as full_name
from employees

17
select upper(product_name) as product_name from products

18
select length(customer_name) as name_length
from customers

19
select left(product_name , 4) as frist_4_letter 
from products

20
update products 
set product_name = replace(product_name, 'phone','mobile')
where product_name like '%phone%'

21
select *,trim(customer_name) as NAME_of_CUS
from customers

22
select name as emp_name, salary as income 
from employees

23
select concat(product_name,' - ',category)
as prdct_name_catgy from products

24
select lower(city) as city
from customers

25
select customer_name,
left(customer_name,3) as frist_name,
right(customer_name,3) as last_name
from customers

26
select name,dept_name from
employees as e left join departments as d
on e.dept_id = d.id

27
select * from
employees as e left join departments as d
on e.dept_id = d.id

28
select dept_name,count(name) as employee_count from
employees as e left join departments as d
on e.dept_id = d.id
group by dept_name
having employee_count = 0

29
select e.name,s.name as manager_name
from employees as e left join employees 
as s on e.manager_id = s.id

30
select customer_name,sum(order_amount) as total_order_atm
from customers as c left join orders 
as r on c.id = r.customer_id
group by customer_name

31
select customer_name,order_id
from customers as c left join orders 
as r on c.id = r.customer_id
group by customer_name,order_id
having order_id is null

32
select product_name,sum(quantity)
as order_details from products as p
left join order_items as r on 
p.id = r.product_id
group by product_name
having order_details is null

33 
select product_name,category,sum(s.qty*p.price)
as total_sale from products as p 
left join sales as s
on p.id = s.product_id
group by product_name,category

34
select name,dept_name,location
from employees as e left join departments as
d on e.dept_id = d.id
where location = 'delhi'

35
select customer_name,city,sum(customer_id) 
as order_placed
from customers as c left join 
orders as r on c.id = r.customer_id
group by customer_name,city
having order_placed is not null

36
select e.name , e.salary ,
m.name as m_name , m.salary as m_salary from
employees as e left join
employees as m on e.manager_id = m.id
where  e.salary > m.salary

37
select dept_name,sum(salary) 
as total_expense from departments as d
left join employees as e 
on d.id = e.dept_id 
group by dept_name 

38
select
o.order_id,o.order_date,
c.customer_name,c.city,
p.product_name,p.category,
oi.quantity,o.order_amount
from orders o left join customers c
on o.customer_id = c.id
left join order_items oi
on o.order_id = oi.order_id
left join products p
on oi.product_id = p.id

39
...

40
select d.dept_name,count(e.id)
as emp_count from departments as d 
left join employees as e 
on d.id = e.dept_id 
group by dept_name 
having emp_count > 3

41
select count(id) as total_emp_count
from employees

42
select dept_name,avg(saLary) as avg_salary
from departments as d left join employees 
as e on d.id = e.dept_id
group by dept_name

43
select dept_name , max(salary) as max_salary,
min(salary) as min_salary 
from employees as e left join 
departments as d on e.dept_id = d.id
group by dept_name

44
select customer_name , count(customer_id)
as count_of_order from customers as c
left join orders as r on 
c.id = r.customer_id 
group by customer_name

45
select sale_date , sum(qty*price)
as per_day_sale from products as p
left join sales as s 
on p.id = s.product_id 
group by sale_date

46
select product_name ,sum(qty) as product_total_qty
from products as p left join
sales as s on p.id = s.product_id
group by product_name
having product_total_qty > 10

47
select dept_name,avg(saLary) as avg_salary
from departments as d left join employees 
as e on d.id = e.dept_id
group by dept_name
having avg_salary > 60000

48
select city , count(name) as students_count 
from students group by city 

49
select customer_name , count(customer_id)
as placed_order from customers as c 
left join orders as r 
on c.id = r.customer_id
group by customer_name
having placed_order > 2

50
select category , sum(qty*price)
as revenue from products as p
left join sales as s 
on  p.id = s.product_id
group by category

51
select e.name,d.dept_name,e.salary 
from employees as e left join 
departments as d on e.dept_id = d.id
where e.salary > (select avg(salary)
from employees as e1 where e1.dept_id = e.dept_id )

52
select count(bonus) as earn_bouns 
from employees

53
select e.name , d.dept_name , e.salary
from employees as e
left join departments as d 
on e.dept_id = d.id
where e.salary in (select max(salary)
from employees as e1 
where e1.dept_id = e.dept_id 
)

54 
select sale_date,sum(sales_amount) as day_total_sale
from sales group by sale_date 
having day_total_sale > (select avg(sales_amount) from sales)

55
select category,sum(qty*price)
as inventory_value from 
products as p  left join 
sales as s on p.id = s.product_id
group by category

56
select name,salary from employees 
where salary > ( select
avg(salary) from employees)

57
select name , mark from students
where mark > (select avg(mark) from students)

58
select customer_name , count(customer_id)
as placed_order from customers as c 
left join orders as r 
on c.id = r.customer_id
group by customer_name
having placed_order = 1


59
select customer_name , count(customer_id)
as order_placed from customers 
as c left join orders as r 
on c.id = r.customer_id
group by customer_name
having order_placed = 0

60
select product_name , price from products
where price > ( select avg(price) 
from products )

61
select * from employees 
order by salary desc
limit 1,1

62
select dept_name , sum(salary)
as dept_salary from employees
as e left join departments as d
on e.dept_id = d.id
group by dept_name
having dept_salary > ( select avg(salary) 
from employees )

63
select c.id,c.customer_name
from customers as c
inner join orders as o
on o.customer_id=c.id
inner join order_items as oi
on o.order_id = oi.order_id
inner join products as p
on oi.product_id=p.id
where p.product_name in ("laptop" , "mobile")
group by c.id,c.customer_name

64
select e.id,e.name,d.dept_name ,e.salary 
from employees as e
inner join departments as d
on e.dept_id=d.id
where e.salary=(select max(e1.salary)from employees e1
where e1.dept_id=e.dept_id)

65
select product_name , qty from 
products as p left join
sales as s on p.id = s.product_id
where qty > ( select avg(qty)
from sales )

66
select customer_name,order_id,
order_date,order_amount
from customers as c  left join
orders as r on c.id = r.customer_id
where order_date = (select max(order_date) from orders
as r2 where r2.customer_id = r.customer_id)

67
select name , dept_name , bonus
from employees as e left join
departments as d on e.dept_id = d.id
where bonus = 0
group by name , dept_name , bonus

68
select customer_name , sum(order_amount)
as total_spent
from customers as c left join 
orders as r on c.id = r.customer_id
group by customer_name 
having total_spent > 10000

69
select e.name , e.salary ,
m.name as m_name , m.salary as m_salary
from employees as e left join employees 
as m on e.manager_id = m.id
where  m.salary > e.salary 

70
select product_name,sum(qty) top_selling
from products as p left join 
sales as s on p.id = s.product_id
group by product_name
order by top_selling desc limit 3

71
select name , dept_name , salary ,
dense_rank ()
over (partition by dept_name order by salary desc)
as dept_salary_rank
from employees as e left join 
departments as d on e.dept_id = d.id

72
select sale_date,
SUM(sales_amount) as daily_sales,
SUM(SUM(sales_amount)) over (order by sale_date
) as running_total from sales
group by sale_date
order by sale_date

73
select name , dept_name , salary
from (
select e.name , d.dept_name , e.salary,
dense_rank ()
over(partition by d.dept_name order by e.salary desc)
as top_salary from 
employees as e left join 
departments as d on e.dept_id = d.id) as ranks
where top_salary <=2

74
select sale_date ,avg(sales_amount) as day_avg
from sales group by sale_date
order by sale_date desc limit 3

75
select order_id,order_date,
order_amount,
row_number() over (
order by order_date) as row_num
from orders

76
select sale_date,sales_amount,
max(sales_amount) over (
partition by sale_date ) as
highest_sale from sales

77
select e.name,d.dept_name,
e.salary,avg(e.salary) over (
partition by e.dept_id) as dept_avg_salary
from employees e left join departments d
on e.dept_id = d.id

78
select e.name,d.dept_name,e.salary,
avg(e.salary) over (partition by e.dept_id
) as dept_avg_salary
from employees e left join departments d
on e.dept_id = d.id;

79
select customer_name,total_spent,
rank() 
over (order by total_spent desc) 
as customer_rank
from ( select c.customer_name,
sum(o.order_amount) as total_spent
from customers c left join orders o
on c.id = o.customer_id
group by c.customer_name) as ranks

81
insert into students
values
(9,'vasanth',22,'villupuram',99),
(10,'vedi',24,'erode',98),
(11,'jeeva',25,'salem',97)

82
update employees as e
join departments as d
on e.dept_id=d.id
set e.salary=e.salary*1.10
where d.dept_name='sales'

83
delete from customers
where id not in (select customer_id from orders)


84
start transaction;
update accounts
set balance=balance-1000
where id=1
rollback
update accounts 
set balance=balance+1000
where id=2
commit

85
truncate table logs

86
create or replace view high_salary_employees as
select * from employees
where  salary>70000
select * from high_salary_employees

87
create or replace view view_table as 
select * from employees 
order by salary desc

update view_table
set bonus=1000
where id=7

select * from view_table

88
drop view view_table

89
create index vasanth on customers(email)
show index from customers

90
show index from orders

91

delimiter //
create procedure employee_detailss(in emp_id int)
begin
select * from employees
where id=emp_id;
end//
delimiter ;

call employee_detailss(1);

92
delimiter //
create procedure total_order()
select count(*) from orders;
end //
delimiter ;

call total_order()

93
delimiter //
create function calculate_tax(amount int)
returns int
deterministic
begin
return amount*0.10;
end //

delimiter ;
select calculate_tax(10000);

94
create table logss(
id int,
name varchar(100),
age int,
date datetime,
type varchar(100))

create table log_table(
id int,
name varchar(100),
age int,
date datetime,
type varchar(100))


delimiter //
create trigger log_table
before insert on logss
for each row
begin 
insert into log_table
values(new.id,new.name,new.age,now(),'ins');
end //
delimiter ;

insert into logss
values
(2,'barath',23,'2026-02-03','student')

select * from logss;
select * from log_table;

95
delimiter //
create trigger customers_delete
after delete on customers
for each row
-- begin
insert into logs()
values('delete customer',now());
end //
delimiter ;


96
create event deleting_old_logs
on schedule every 1 month
starts'2026-03-01 12:00:00'
do
delete from logs
where log_date<curdate()-interval 1 year;







