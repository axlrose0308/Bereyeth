#THE SEMINAR MANAGEMENT SYSTEM
## Project setup:
###Git
install git. for linux you do:
```
sudo apt-get update
sudo apt-get install git
```
then:
```aidl
cd ..to the location you want to keep the project
sudo git clone https://github.com/axlrose0308/Bereyeth.git
```
### Database
1. google mysql and download a mysql-server binary
2. install it follows the instruction, linux user please install 
apt repos key deb first. Follow the instructions during installing for 
setup database user and password as below:
3. setup your database user name as root
4. setup root's password as 1234
5. after installing, login:
```aidl
sudo mysql -u root -p
```
and then enter the password you configured. 
```aidl
1234
```
then:
````aidl
mysql>CREATE DATABASE seminar_management_system;
````
then:
```aidl
mysql>USE seminar_management_system
```
then import the database source file
```aidl
mysql> source seminar.sql
```
At this point we finished configure Database.

### Integrated Development Environment
1. google intellij-idea and install it using ultimate version, 
you can get a student free license for ultimate version. 
2. open the project using intellij
3. follow the instruction, add the necessary framework integration. 
for this project, it uses springMVC which serves the back-end server for handling http
requests and responses, SpringJPA for database entity-model mapping, Hibernet for database relationship
connection, Maven for dependency injection and JAVA package management. 
4. In other words, you should get a hint saying that it detects Maven framework.
follow the instruction of that hint. 

At this point we finished configure IDE and its settings. 

### Tomcat Servlet
1. google tomcat and download tomcat 8 (it has to be this exact version).
2. install or extract it to a location, remember this location.
3. in Intellij, there will be a 'ADD CONFIGURATION' string located at the 
top lef hand side of the tool bar. click that.
4. then click the '+' sign, scroll down to find 'Tomcat local' configuration template.
5. locate your server and add it. 
6. add artifact, under this very same dialog, click deployment tab, 
7. add the war:exploded. 
8. apply and save

At this point you should be able to run the project without exceptions.
