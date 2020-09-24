# Remove the /var/atlassian/application-data/jira directory
rm -rf /var/atlassian/application-data/jira
mkdir /var/atlassian/application-data/jira
chown -R jira:jira /var/atlassian/application-data/jira
chmod -R u=rwx,go-rws /var/atlassian/application-data/jira

sudo -u postgres sh -c "psql -f formatpg.sql";


