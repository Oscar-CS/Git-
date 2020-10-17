GIT_USR=$1
curl -s "https://api.github.com/users/$GIT_USR/repos" | \
    grep "^    \"url\"" |cut -d "\"" -f 4 | head -n 1 |  xargs -I % curl "%"
