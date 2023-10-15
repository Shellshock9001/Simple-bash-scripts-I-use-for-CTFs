#!/bin/bash

# This script will ask you where you would like to store the file. You can change this or add more options the way you see fit. This way, you'll only need one copy of the script to put your files any where
# Next, It will prompt you for a name to give the directory. Give it a meaningful name.
# Lastly it will create a text file with the name you chose for the directory and give it an extension added to your dirname_notes.txt
# I like to use sublime text. If you use VIM which I hope you don't, you can change it to that if you please.
# I hope this helps you.
# just give this script chmod +x privileges and run it with ./labs.sh 

# Prompt the user for htb or tryhackme path
read -p "Would you like to save this directory in htb or thm?: " choice

case $choice in
    htb)
        #This can be any path you want, any path that you usually store your files.
        base_dir="/home/user/Documents/htb/"
        ;;
    thm)
        # I typically keep separate directories for each platform I use to keep everything organized.
        base_dir="/home/user/Documents/tryhackme/"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Prompt the user for a directory name
read -p "Enter a directory name: " dirname

# Create the directory
mkdir -p "${base_dir}$dirname"

# Generate the text file name with the _notes.txt extension
# Keeping a notes files named after the machine you're working on keeps it organized.
notes_filename="${dirname}_notes.txt"

# Create the text file inside the directory
touch "${base_dir}${dirname}/${notes_filename}"

# Open Sublime Text with the new text file
subl "${base_dir}${dirname}/${notes_filename}"
