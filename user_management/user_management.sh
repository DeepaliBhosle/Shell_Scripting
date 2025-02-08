#!/bin/bash


# Function to create a new user

create_user() {
        read -p "Enter new username: " username


        # Check if user already exist
        if id "$username" &>/dev/null; then
                echo "Error: User '$username' already exist!"
                exit 1

        fi

        read -s -p "Enterpassword: " password
        echo
        read -s -p "Cinfirm password: " password_confirm
        echo


        if [ "$password" != "$password_confirm" ]; then
             echo "Error: Passwords do not match!"
             exit 1

        fi


        # Create the user and set password

        sudo useradd -m "$username" && echo "$username:password" | sudo chpasswd

        if [ $? -eq 0 ]; then
            echo "User '$username' created successfully!"
        else
            echo "Error: Failed to create user."

        fi

}

# Argument Parsing
  if [[ "$" == "-c" || "$1" == "--create" ]]; then
          create_user
  else
     echo "Usage: $0 -c| --create"
     exit 1                                                                              
  fi        



