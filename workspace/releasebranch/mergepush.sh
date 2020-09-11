while read p; do
  cd "$p"
  git commit -m "adding a change from the feature branch"
  echo "git commit"
  git push origin release22
  echo "push to cloud"
  cd ..
  echo "reset"
 done <repolist

