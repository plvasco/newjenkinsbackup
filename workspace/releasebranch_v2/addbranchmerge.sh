#add branch


#ls | grep 'cloud' > repolist

while read p; do
  cd "$p"
  git branch release01
  echo "branch created"
  git fetch && git checkout release01
  echo "checkout branch"
  touch branchcheck
  echo "create file"
  git add .
  echo "git add"
 # git commit -m "adding a change from the feature branch"
 # echo "git commit"
 # git push origin release21
 # echo "push to cloud"
  cd ..
  echo "reset"
 done <repolist2



