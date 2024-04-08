#!/bin/bash
service mysql start
mysql < setup.sql
mysql -uroot -pgexingchen < init.sql
nginx
java -jar /app.jar