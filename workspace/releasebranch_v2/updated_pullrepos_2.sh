# generate a script ./clone-repos.sh from a list of repos fetched via Bitbucket API
# note: requires 'curl' and 'jq' to be installed

set -e

echo -n '' > clone-repos.sh
chmod +x clone-repos.sh

#ONPREM_USER=xxxxx
#ONPREM_PASS=......
#ONPREM_PROJECT=MYINTPROJ
#curl -s -u "$ONPREM_USER:$ONPREM_PASS" https://bitbucket.mycompany.internal/rest/api/1.0/projects/$ONPREM_PROJECT/repos/\?limit=1000 | jq -r '.values[] | {slug:.slug, links:.links.clone[] } | select(.links.name=="ssh") | "git clone \(.links.href) \(.slug)-server"' >> clone-repos.sh

ORG_USER=pietto@gmx.com
ORG_PASS=Smooch!991
curl -s -u "$ORG_USER:$ORG_PASS" https://api.bitbucket.org/2.0/repositories/?role=member | jq -r '.values[] | {slug:.slug, links:.links.clone[] } | select(.links.name=="ssh") | "git clone \(.links.href) \(.slug)-cloud"' >> clone-repos.sh

# run the generated script
./clone-repos.sh

# copy data from script to usable file
ls | grep 'cloud' > repolist

# loop to create branch and commit and push
#while read p; do
#  cd "$p"
#  git branch release4
#  git fetch && git checkout release4
#  touch branchcheck:wq
#  git add .
#  git commit -m "adding a change from the feature branch"
#  git push origin release4
#  done <repolist
