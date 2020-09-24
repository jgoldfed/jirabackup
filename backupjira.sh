#Backup the XML file by going to SYSTEM/Backup
#Once backup is complete, stop Jira

jiraVersion=$1;
jiraName="jira$jiraVersion"
sudo -u jira sh -c "/opt/bsaitmod/atlassian/jira/bin/stop-jira.sh";
#Copy the attachment directory.  As root, make the backup directory and copy the <JIRA>/data directory
sudo  sh -c "mkdir -p /var/backup/$jiraName && chmod -777 /var/backup/$jiraName && cp -Rf /var/atlassian/application-data/jira /var/backup/$jiraName/";

#backup the postgres db
#See instructions from https://www.linode.com/docs/databases/postgresql/how-to-back-up-your-postgresql-database/

sudo -u postgres sh -c "pg_dump jiradb > ~/jiradb$1.bak";
#Backup the XML file by going to SYSTEM/Backup
exit;
