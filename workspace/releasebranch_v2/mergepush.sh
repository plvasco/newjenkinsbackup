#git config credential.helper cache
#git push http://example.com/repo.git
#git clone https://pietto@bitbucket.org/pietto/bitbucket.git

#git config --global user.name "Pietto Vasco"
#git config --global user.email pietto@gmx.com

# echo "cred"

while read p; do
  git config --global credential.helper store 
  #git config --global user.name "Pietto Vasco"
  #git config --global user.email pietto@gmx.com
  cd "$p"
  git commit -m "adding a change from the feature branch"
  #echo -e "Smooch!991"
  git push origin release01
  echo "push to cloud"
  cd ..
  echo "reset"
 done <repolist

