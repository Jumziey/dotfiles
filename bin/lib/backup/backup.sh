ignored() {
  test="$1"
  shift
  ignoreArray=("$@")

  for ignore in "${ignoreArray[@]}"; do
    if [[ "$test" == "$ignore" ]]; then
      true
      return
    fi
  done
  false
  return
}

backup() {
  backup_root="$1"
  host_root="$2"
  file="$3"

  #Lets just return if file
  #to backup does not exist
  if ! [ -f "$host_root/$file" ]; then
    #Nothing to do, it does not exist
    return
  fi

  # Checking if host file is a symlink
  if [ -h "$host_root/$file" ]; then
    #Well then, lets just remove it
    rm "$host_root/$file"
    #Nothing left to do
    return
  fi

  # Make directory in backup_root
  mkdir -p "$(dirname "$backup_root/$file")"

  # Make backup
  mv "$host_root/$file" "$backup_root/$file"

}

link_dotfile() {
  script_root="$1"
  host_root="$2"
  file="$3"

  # Lets make sure we have a target
  if ! [ -f "$script_root/$file" ]; then
    echo "$script_root/$file not found"
  fi

  #See if folder exists to link place
  #create otherwise
  if ! [ -d "$(dirname "$host_root/$file")" ]; then
    mkdir -p "$(dirname "$host_root/$file")"
  fi

  #Finally, lets make the symlink
  ln -sfn "$script_root/$file" "$host_root/$file"
}

create_backup_root() {
  backup_root="$1"

  if [ -d "$backup_root" ]; then
    backup_root_old="$backup_root-$(date +%m-%d-%y-%N)"
    echo "Moving $backup_root to $backup_root_old"
    mv "$backup_root" "$backup_root_old"
  fi

  echo "Creating a fresh $backup_root"
  mkdir -p "$backup_root"

}
