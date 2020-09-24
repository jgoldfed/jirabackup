drop database jiradb;
drop user jiradbadmin;
create database jiradb;
create user jiradbadmin with encrypted password 'admin';
grant all privileges on database jiradb to jiradbadmin;

