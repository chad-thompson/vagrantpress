#!/bin/bash

# -------------------------------------------------
# a short helper to trigger wordpress installations
# 
# This script will monitor a given directory. Create a new directory in the monitored 
# directory and place a file (or directory) named with a wordpress version number in
# your newly created directory. This script will then trigger a wordpress installation
# with the given wordpress version.
# 
# Example: 
#
# Call this script with directory to watch (no trailing slash)
# ./trigger_install.sh /watch/this/directory 
# 
# Create a new directory in /watch/this/directory 
#   $ mkdir /watch/this/directory/new.wp
# Create a file or directory with the wordpress version number
#   $ touch /watch/this/directory/new.wp/3.5.2
# ... the script will now install wordpress version 3.5.2 in /watch/this/directory/new.wp
# The file 3.5.2 or directory 3.5.2 is deleted.
#
# Please note that /watch/this/directory/new.wp/ must only contain the file or
# directory with the wordpress version. Nothing else.
# 
# Run this script in the background and send all output to /dev/null
#   $ nohup ./trigger_install.sh 0<&- &>/dev/null &
#
# -------------------------------------------------

WATCH_DIR=$1 # no trailing slash
SLEEP=10 # seconds before running again

printf "%s\n" "Scanning directory '$WATCH_DIR' every $SLEEP seconds"

while true; do

  # loop over all directories in watch dir
  for dir in $WATCH_DIR/*/; do
    # ... in a subdirectory of watch dir

    # get number of files in directory
    num_of_files=$(cd $dir && ls | wc -l)
    if [[ $num_of_files == 1 ]]; then

      # okay, there is only one file
      # get the name and check if it 
      # matches the regular expression
      file_name=$(cd $dir && ls)
      if [[ $file_name =~ ^[0-9]\.[0-9]\.[0-9]$ ]]; then

        # we found a match!
        # immediately delete the according file
        # so the following commands are triggered
        # only once
        rm -rf $dir$file_name

        version=$file_name
        printf "%s\n" "Installing wordpress version '$version' in directory '$dir'"

        # change directory
        cd $dir

        # parse name and domain 
        name_with_domain=$(basename $dir) # e.g. test.wp
        domain=${name_with_domain##*.} # e.g. wp
        name=${name_with_domain/.$domain} # e.g. test

        # install wordpress with wp-cli ...
        wp core download --version=$version --path="."
        wp core config --dbname="$name" --dbuser="root" --dbpass="vagrant" --dbhost="localhost"
        wp db create
        wp core install --url="http://$name_with_domain" --title="$name" --admin_name="vagrant" --admin_password="vagrant" --admin_email="vagrant@vagrant"

        # let user know i finished my job
        touch __ready__

      fi
    fi
      
  done

  # good night
  sleep $SLEEP
done