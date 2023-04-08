import mysql.connector
db=mysql.connector.connect(host='localhost', database='badibasket', user='root', password='root')
cursor=db.cursor()
while(1):
        print("******* Welcome to the Badi Basket *******")
        print()
        print("Select from these options: ")
        print("1. Login\n2. See products\n3. Customer with order value > 75000\n4. Product with quantity 0")
        num=int(input())
        if(num==1):
            print("Enter Username")
            username=input()
            cursor.execute("select idCustomer from customer where username='"+username+"';")
            idcustomer=cursor.fetchone()
            if(idcustomer==None):
                print("Username doesn't exist")
            else:
                print(idcustomer)
                print("Enter password")
                password=input()
                cursor.execute("select password from customer where idCustomer='"+str(idcustomer[0])+"';")
                passw=cursor.fetchone()
                if(password!=passw[0]):
                    print("Incorrect Passsword")
                else:
                    print("Select from these options")
                    print("1. View products\n2. Total sales of during this year\n3. Year-wise expenditure of each customer.\n4. Total number of orders placed by a customer\n5.  Average order amount for each address.")
                    n=int(input())
                    if(n==1):
                        cursor.execute("SELECT * FROM badibasket.product;")
                        data=cursor.fetchall()
                        for i in data:
                             print(i)
                    if(n==2):
                        cursor.execute("SELECT YEAR(estimated_time_of_delivery) AS year, QUARTER(estimated_time_of_delivery) AS quarter, SUM(total_amount) AS sales FROM `order` GROUP BY YEAR(estimated_time_of_delivery), QUARTER(estimated_time_of_delivery) WITH ROLLUP;")
                        que1=cursor.fetchall()
                        for i in que1:
                             print(i)
                    if(n==3):
                        cursor.execute("SELECT customer.customer_name, YEAR(estimated_time_of_delivery) AS year, SUM(total_amount) AS sales FROM `order` INNER JOIN customer ON `order`.customer_id = customer.idCustomer GROUP BY customer.customer_name, YEAR(estimated_time_of_delivery) WITH ROLLUP;")
                        que2=cursor.fetchall()
                        for i in que2:
                             print(i)
                    if(n==4):
                        cursor.execute("SELECT c.customer_name, COUNT(o.idOrder) AS num_orders FROM customer c LEFT JOIN `order` o ON c.idCustomer = o.customer_id GROUP BY c.customer_name WITH ROLLUP;")
                        que3=cursor.fetchall()
                        for i in que3:
                             print(i)
                    if(n==5):
                        cursor.execute("SELECT address, YEAR(estimated_time_of_delivery) AS order_year, AVG(total_amount) AS avg_order_amount FROM `order` INNER JOIN customer ON customer_id = idCustomer GROUP BY address, order_year WITH ROLLUP;")
                        que4=cursor.fetchall()
                        for i in que4:
                             print(i)
        if(num==2):
            cursor.execute("SELECT * FROM badibasket.product;")
            data=cursor.fetchall()
            for i in data:
                print(i)
        
        if(num==3):
            cursor.execute("SELECT c.customer_name, c.address FROM customer c INNER JOIN `order` o ON c.idCustomer = o.customer_id WHERE o.total_amount > 75000;")
            que5=cursor.fetchall()
            for i in que5:
                print(i)
        if(num==4):
            cursor.execute("SELECT product_name, product_type FROM product WHERE product_quantity = 0;")
            que5=cursor.fetchall()
            for i in que5:
                print(i)