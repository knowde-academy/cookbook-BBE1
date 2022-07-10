1. git clone https://github.com/knowde-academy/cookbook-BBE1.git cookbook
2. cd cookbook
3. rvm install ruby-2.7.4
4. sudo yum install postgresql96*
5. sudo service postgresql96 initdb
6. service postgresql96 start
7. sudo su postgres -c psql
8. CREATE USER "ec2-user" SUPERUSER;
9. \q
10. bundle install
11. rails db:create
12. rails db:migrate
13. rails s
