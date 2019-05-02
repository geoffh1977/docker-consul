#!/bin/bash
# Update The Git Repository Automatically
LOCAL_VERSION=$(grep "finalImageVersion" config.yml | cut -d: -f 2 | sed 's/ //g')
APP_NAME="$(grep "appName" config.yml | cut -d: -f 2- | sed 's/^ //g')"

# Update Local Repository Tags
git fetch --tags
echo

# Check If Version Already Exists In Repository
if git tag | grep -q "${LOCAL_VERSION}"
then
  echo "Version ${LOCAL_VERSION} Already Exists In Repository - No Action Required"
  exit 1
fi

# Update Git With New Version
echo "Version ${LOCAL_VERSION} Not Found In Repository. Updating Repository..."
echo "  Checking Out Master Branch"
git checkout master > /dev/null

echo "  Commiting Changed Files To Local Repository"
git add -A :/ > /dev/null
git commit -m "Automated: Updating To Version ${LOCAL_VERSION}" > /dev/null

echo "  Create A New Repository Tag For Version ${LOCAL_VERSION}"
git tag -a "${LOCAL_VERSION}" -m "${APP_NAME} Container Version ${LOCAL_VERSION}" > /dev/null

echo "  Pushing Updates To Repository"
git push origin master > /dev/null
git push --tags origin > /dev/null
echo "Repository Successfully Updated"
echo

exit 0
