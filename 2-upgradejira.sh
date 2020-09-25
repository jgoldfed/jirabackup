# Get the latest version and apply permissions

if [ $# -ne 1 ]
  then
    echo "Error: You must supply a version number (6.3, 7.0, 7.13, 8.8)"
  exit
fi

jiraVersion=$1;

if ! [[ "$jiraVersion" =~ ^("6.3"|"7.0"|"7.13"|"8.8")$ ]]
then
  echo "Error: You must supply one of these versions: 6.3, 7.0, 7.13. 8.8"
 exit
fi

if [ $jiraVersion == "6.3" ]; then jiraVersionMajMin="6.3.12"; fi
if [ $jiraVersion == "7.0" ]; then jiraVersionMajMin="7.0.11"; fi
if [ $jiraVersion == "7.13" ]; then jiraVersionMajMin="7.13.0"; fi
if [ $jiraVersion == "8.8" ]; then jiraVersionMajMin="8.8.0"; fi


jiraName="atlassian-jira-software-$jiraVersionMajMin"


rootInstallDir="/opt/bsaitmod"
wget -O $rootInstallDir/$jiraName.tar.gz https://www.atlassian.com/software/jira/downloads/binary/$jiraName.tar.gz
chmod +x $rootInstallDir/$jiraName.tar.gz

# The next step will create directory "$jiraName-standalone"
tar -xzf $rootInstallDir/$jiraName.tar.gz -C $rootInstallDir

# Give ownership to the standalone directory
chown -R jira:jira $rootInstallDir/$jiraName-standalone
chmod -R u=rwx,go-rwx $rootInstallDir/$jiraName-standalone

echo "Jira version $jiraVersionMajMin successfully installed to $rootInstallDir/$jiraName-standalone:"
ls -alrt  $rootInstallDir
