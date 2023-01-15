#! /bin/bash

# ----------------------------------------------------------------

build_docker() {
    echo "building the docker by : docker build -t node-app ."
    docker build -t node-app .
}

# ----------------------------------------------------------------

run_docker() {
    echo "Running Docker : docker run -d -p 3030:3030 --name node-app --env-file=.env node-app " 
    docker run -d -p 3034:3034 --name node-app  node-app 
}

# ----------------------------------------------------------------

start_docker() {
    echo "Starting the docker : docker start node-app " 
    docker start node-app
}

# ----------------------------------------------------------------
restart_docker() {
    echo "Restart the Docker : docker restart node-app " 
    docker restart node-app
}
# ----------------------------------------------------------------

stop_docker() {
    echo "Stopping the Docker : docker stop node-app"  
    docker stop node-app
}

# ----------------------------------------------------------------

enter_docker_shell(){
    echo "docker exec -it node-app  /bin/sh"
    docker exec -it node-app  /bin/sh
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
