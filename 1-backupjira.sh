#Backup the XML file by going to SYSTEM/Backup
#Once backup is complete, stop Jira
if [ $# -ne 1 ]
  then
    echo "Error: You must supply a version number (6.3, 7.0, 7.13, 8.8)"
  exit
fi

jiraVersion=$1;

if ! [[ "$jiraVersion" =~ ^(6.3|7.0|7.13|8.8)$ ]] 
then
  echo "Error: You must supply one of these versions: 6.3, 7.0, 7.13. 8.8"
 exit
fi

jiraName="jira$jiraVersion"
jiradbName="jiradb$jiraVersion.bak"

sudo -u jira sh -c "/opt/bsaitmod/atlassian/jira/bin/stop-jira.sh";
#Copy the attachment directory.  As root, make the backup directory and copy the <JIRA>/data directory
sudo  sh -c "mkdir -p /var/backup/$jiraName && chmod -777 /var/backup/$jiraName && cp -Rf /var/atlassian/application-data/jira /var/backup/$jiraName/";

#backup the postgres db
#See instructions from https://www.linode.com/docs/databases/postgresql/how-to-back-up-your-postgresql-database/

sudo -u postgres sh -c "pg_dump jiradb > ~/$jiradbName";
exit 

