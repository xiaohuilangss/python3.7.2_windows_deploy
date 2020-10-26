
echo commit all files first...
git commit -m 'timely-commit'

echo force pull...
git fetch --depth=1
git reset --hard origin/master
git pull

echo force pull complete!
