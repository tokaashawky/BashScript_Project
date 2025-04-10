# #!/usr/bin/bash
[[ ! -d "../Databases" ]] && mkdir "../Databases"
while true; do
    choice=$(zenity --list --title="Bash DBMS" --column="Options" \
        "Create Database" "List Databases" "Connect to Database" "Drop Database" "Exit" \
        --height=300 --width=400)

    status=$?

    if [ "$status" -ne 0 ] || [ -z "$choice" ]; then
        exit 0
    fi
    case $choice in
        "Create Database")
           . ./create_db.sh
            ;;
        "List Databases")
           . ./list_dbs.sh
            ;;
        "Connect to Database")
           . ./connect_to_db.sh
            ;;
        "Drop Database")
           . ./drop_db.sh
            ;;
        "Exit")
            exit 0
            ;;
        *)
            zenity --error --text="Invalid choice. Please try again."
            ;;
    esac
done

