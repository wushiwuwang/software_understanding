#!/bin/bash

echo Hello World!>a.txt
export SWAMPUSER=lost66666
export SWAMPPASS=Aa76318320
export PACKAGE_NAME=cpp-example.tar.gz
export UPLOAD_NAME=cpp
umask 0077
export CSA=swa-csaweb-pd-01.mir-swamp.org
curl -f -c csa-cookie-jar.txt \
  -H "Content-Type: application/json; charset=UTF-8" \
  -X POST \
  -d "{\"username\":\"$SWAMPUSER\",\"password\":\"$SWAMPPASS\"}" \
  https://$CSA/login > rws-userinfo.txt
perl -n -e 'print $1 if (/\"user_uid\":\"([\w-]+)\"/);' \
  < rws-userinfo.txt > swamp-user-uuid.txt
export SWAMP_USER_UUID=`cat swamp-user-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/users/$SWAMP_USER_UUID > swamp-user-details.txt
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/users/$SWAMP_USER_UUID/projects/trial \
  > swamp-myproject.txt
perl -n -e 'print $1 if (/\"project_uid\":\"([\w-]+)\"/);' \
  < swamp-myproject.txt > swamp-project-uuid.txt
export SWAMP_PROJECT_UUID=`cat swamp-project-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/users/$SWAMP_USER_UUID/projects > swamp-projects.txt
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -X POST \
  -F file=@$PACKAGE_NAME \
  -F user_uid=$SWAMP_USER_UUID \
  https://$CSA/packages/versions/upload > swamp-uploaded-file.txt
perl -n -e 'print $1 if (/\"destination_path\":\"([\w-]+)\"/);' \
  < swamp-uploaded-file.txt > swamp-dest-path.txt
export SWAMP_DEST_PATH=`cat swamp-dest-path.txt`
export SWAMP_PACKAGE_NAME=$UPLOAD_NAME
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -H "Content-Type: application/json; charset=UTF-8" \
  -X POST \
  -d "{\"package_sharing_status\":\"private\",\
       \"name\":\"$SWAMP_PACKAGE_NAME\",\
       \"description\":\"\",\
       \"external_url\":\"\",\
       \"package_type_id\":1}" \
  https://$CSA/packages > swamp-package.txt
perl -n -e 'print $1 if (/\"package_uuid\":\"([\w-]+)\"/);' \
  < swamp-package.txt > swamp-package-uuid.txt
export SWAMP_PACKAGE_UUID=`cat swamp-package-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -H "Content-Type: application/json; charset=UTF-8" \
  -X POST \
  -d "{\"version_string\":\"1.0\", \
       \"version_sharing_status\":\"protected\", \
       \"package_uuid\":\"$SWAMP_PACKAGE_UUID\", \
       \"notes\":\"\", \
       \"source_path\":\"\", \
       \"config_dir\":\"\", \
       \"config_cmd\":\"\", \
       \"config_opt\":\"\", \
       \"build_file\":\"\", \
       \"build_system\":\"no-build\", \
       \"build_target\":\"\", \
       \"build_dir\":\"\", \
       \"build_opt\":\"\", \
       \"package_path\":\"$SWAMP_DEST_PATH/$PACKAGE_NAME\"}" \
  https://$CSA/packages/versions/store > swamp-pkgver.txt
perl -n -e 'print $1 if (/\"package_version_uuid\":\"([\w-]+)\"/);' \
  < swamp-pkgver.txt > swamp-pkgver-uuid.txt
export SWAMP_PKGVER_UUID=`cat swamp-pkgver-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -X PUT \
  -d "projects[0][project_uid]=$SWAMP_PROJECT_UUID" \
  https://$CSA/packages/versions/$SWAMP_PKGVER_UUID/sharing
curl -f https://$CSA/packages/public > swamp-public-packages.txt
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/packages/protected/$SWAMP_PROJECT_UUID > \
  swamp-protected-packages.txt
curl -f https://$CSA/packages/types > swamp-package-types.txt
curl -f https://$CSA/tools/public > swamp-public-tools.txt
curl -f https://$CSA/tools/restricted > swamp-restricted-tools.txt
curl -f https://$CSA/platforms/public > swamp-public-platforms.txt

perl -n -e 'print $1 if \
  (/{\"package_uuid\":\"([\w-]+)\",\"name\":\"cpp\",/);' \
  < swamp-protected-packages.txt > swamp-main-uuid.txt
export SWAMP_PACKAGE_UUID=`cat swamp-main-uuid.txt`
perl -n -e 'print $1 if \
  (/{\"tool_uuid\":\"([\w-]+)\",\"name\":\"GCC\",/);' < \
  swamp-public-tools.txt > swamp-findbugs-uuid.txt
export SWAMP_TOOL_UUID=`cat swamp-findbugs-uuid.txt`
perl -n -e 'print $1 if \
  (/{\"platform_uuid\":\"([\w-]+)\",\"name\":\"Fedora\",/);' \
  < swamp-public-platforms.txt > swamp-fedora-uuid.txt
export SWAMP_PLATFORM_UUID=`cat swamp-fedora-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -H "Content-Type: application/json; charset=UTF-8" \
  -X POST \
  -d "{\"project_uuid\":\"$SWAMP_PROJECT_UUID\",\
       \"package_uuid\":\"$SWAMP_PACKAGE_UUID\",\
       \"platform_uuid\":\"$SWAMP_PLATFORM_UUID\",\
       \"tool_uuid\":\"$SWAMP_TOOL_UUID\"}" \
  https://$CSA/assessment_runs > swamp-a-run.txt
perl -n -e 'print $1 if (/\"assessment_run_uuid\":\"([\w-]+)\"/);' \
  < swamp-a-run.txt > swamp-a-run-uuid.txt
export SWAMP_ARUN_UUID=`cat swamp-a-run-uuid.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -X POST \
  -d "notify-when-complete=true" \
  -d "assessment-run-uuids[]=$SWAMP_ARUN_UUID" \
  https://$CSA/run_requests/one-time > swamp-a-run-request.txt
sleep 4m
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/projects/$SWAMP_PROJECT_UUID/assessment_runs \
  > swamp-assessments.txt
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/projects/$SWAMP_PROJECT_UUID/assessment_results \
  > swamp-assessment-results.txt
perl -n -l -e 'print "$1" while (/\"assessment_result_uuid\":\"([\w-]+)\"/g);' \
  < swamp-assessment-results.txt > swamp-assessment-result-uuids.txt
export SWAMP_ASSESSMENT_RESULT_UUID=`head -1 swamp-assessment-result-uuids.txt`
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  https://$CSA/v1/assessment_results/$SWAMP_ASSESSMENT_RESULT_UUID/scarf \
  > scarf.xml
curl -f -b csa-cookie-jar.txt -c csa-cookie-jar.txt \
  -X DELETE \
  https://$CSA/packages/$SWAMP_PACKAGE_UUID
