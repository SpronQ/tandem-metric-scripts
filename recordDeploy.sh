#!/bin/bash

set -x
echo $WERCKER_GIT_COMMIT
echo $WERCKER_RUN_ID
TIMESTAMP=`date -u +"%FT%T.000Z"`
COMMITTER=`git log -1 --pretty=format:%ae`
JSON_FMT='{\"ci_cd_id\":\"%s\",\"product_name\":\"%s\",\"timestamp\":\"%s\",\"git_commit\":\"%s\",\"committer\":\"%s\"}'
EVENT=`printf "$JSON_FMT" "$WERCKER_RUN_ID" "$PRODUCT_NAME" "$TIMESTAMP" "$WERCKER_GIT_COMMIT" "$COMMITTER"`
bash <(curl https://raw.githubusercontent.com/SpronQ/tandem-metric-scripts/master/recordDeploy.sh)
