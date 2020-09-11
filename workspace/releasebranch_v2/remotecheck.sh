set -e

echo -n '' > login-repos.sh
chmod +x login-repos.sh

ORG_USER=pietto@gmx.com
ORG_PASS=Smooch!991
curl -s -u "$ORG_USER:$ORG_PASS" https://api.bitbucket.org/2.0/repositories/?role=member | jq -r '.values[] | {slug:.slug, links:.links.clone[] } | select(.links.name=="https") | "git remote set-url origin \(.links.href)"' >> login-repos.sh

# run the generated script
./login-repos.sh

# copy data from script to usable file
#ls | grep 'cloud' > repolist

#"git clone \(.links.href) \(.slug)-cloud"'
