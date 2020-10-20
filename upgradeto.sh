if [ $# -ne 1 ]
  then
    echo "Error: You must supply a version number (7.0, 7.13, 8.8)"
  exit
fi

jiraVersion=$1;

if ! [[ "$jiraVersion" =~ ^(7.0|7.13|8.8)$ ]]
then
  echo "Error: You must supply one of these versions: 7.0, 7.13. 8.8"
 exit
fi

if [ $jiraVersion == "7.0" ]; then jiraBackupVersion="6.3"; fi
if [ $jiraVersion == "7.13" ]; then jiraBackupVersion="7.0";  fi
if [ $jiraVersion == "8.8" ]; then jiraBackupVersion="7.13"; fi

./1-backupjira.sh $jiraBackupVersion
./2-unpackagejira.sh $jiraVersion
./3-preparejira.sh
./4-startjira.sh $jiraVersion
