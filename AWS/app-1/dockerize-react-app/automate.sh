#! /bin/bash

# ----------------------------------------------------------------

build_docker() {
    echo "building the docker by : docker build -t react-app ."
    docker build -t react-app .
}

# ----------------------------------------------------------------

run_docker() {
    echo "Running Docker : docker run -d -p 3020:3020 --name react-app --env-file=.env react-app " 
    docker run -d -p 3020:3020 --name react-app  react-app 
}

# ----------------------------------------------------------------

start_docker() {
    echo "Starting the docker : docker start react-app " 
    docker start react-app
}

# ----------------------------------------------------------------
restart_docker() {
    echo "Restart the Docker : docker restart react-app " 
    docker restart react-app
}
# ----------------------------------------------------------------

stop_docker() {
    echo "Stopping the Docker : docker stop react-app"  
    docker stop react-app
}

# ----------------------------------------------------------------

enter_docker_shell(){
    echo "docker exec -it react-app  /bin/sh"
    docker exec -it react-app  /bin/sh
}

# ----------------------------------------------------------------

# Menu Options
option_1="Build   The Docker"
option_2="Run     The Docker"
option_3="Start   The Docker"
option_4="Restart The Docker"
option_5="Stop    The Docker"
option_6="Enter   The Docker shell"
option_7="Quit" 

# ----------------------------------------------------------------

PS3='Please enter your choice or q to Quit:'

# ----------------------------------------------------------------

options=("${option_1}" 
         "${option_2}" 
         "${option_3}" 
         "${option_4}" 
         "${option_5}" 
         "${option_6}"  
         "${option_7}")


# ----------------------------------------------------------------

select opt in "${options[@]}"
do
    case $opt in
        "${option_1}")
            build_docker
            ;;
        "${option_2}")
            run_docker
            ;;
        "${option_3}")
            start_docker
            ;;       
        "${option_4}")
            restart_docker
            ;;            
        "${option_5}")
            stop_docker
            ;;
        "${option_6}")
            enter_docker_shell
            ;;     
        "${option_7}")
            echo "Bye bye sweetie :) ";
            break 
            ;;
        *) echo "Bye bye sweetie :) "; break;;
    esac
done