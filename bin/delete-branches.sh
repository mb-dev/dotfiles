for branch in $(git branch | cut -c3-)
  do
    echo "Would you like to delete $branch? [Y]es (or ENTER)/[N]o"
    read REPLY
    if [[ -z $REPLY ]] || [[ $REPLY =~ ^[Yy] ]]; then
      git branch -D $branch
    fi
done
