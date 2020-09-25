# Remove the /var/atlassian/application-data/jira directory
sudo rm -rf /var/atlassian/application-data/jira
sudo mkdir /var/atlassian/application-data/jira
sudo chown -R jira:jira /var/atlassian/application-data/jira
sudo chmod -R u=rwx,go-rws /var/atlassian/application-data/jira
sudo cp formatpg.sql /var/lib/pgsql/

sudo -i -u postgres sh -c "psql -f formatpg.sql";


