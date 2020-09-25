# Set the versioning info

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

if [ $jiraVersion == "6.3" ]; then jiraVersionMajMin="6.3.12"; jiraBackupName="jira6.3"; fi
if [ $jiraVersion == "7.0" ]; then jiraVersionMajMin="7.0.11"; jiraBackupName="jira6.3"; fi
if [ $jiraVersion == "7.13" ]; then jiraVersionMajMin="7.13.0"; jiraBackupName="jira7.0";  fi
if [ $jiraVersion == "8.8" ]; then jiraVersionMajMin="8.8.0"; jiraBackupName="jira7.13"; fi


jiraName="atlassian-jira-software-$jiraVersionMajMin"


rootInstallDir="/opt/bsaitmod"
homeDir="/var/atlassian/application-data/jira"
backupDir="/var/backup/$jiraBackupName/jira"

sudo cp $backupDir/export/jira-backup* $homeDir/import

sudo cp -Rf $backupDir/data/* $homeDir/data
sudo chown -R jira:jira $homeDir

