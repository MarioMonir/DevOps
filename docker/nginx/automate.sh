#! /bin/bash
docker_name="nginx"
port="80"

# -------------------------------------

# Options to Select in the menu
options=("Build docker $docker_name and goaccess " 
         "Run   docker $docker_name and goaccess")

# -------------------------------------

build_dockers() {
    docker build -t $docker_name . 
    docker build \
        --name="goaccess" \
        --restart=always \
        -p 7880:7880 \
        -v /root/npm_data/logs:/opt/logs \
        -e SKIP_ARCHIVED_LOGS=FALSE \
        xavierh/goaccess-for-nginxproxymanager:latest
    
}

# -------------------------------------

run_dockers() {
    docker run -d -p 0.0.0.0:$port:$port --name $docker_name  $docker_name
    docker start xavierh/goaccess-for-nginxproxymanager:latest
}

# -------------------------------------

PS3='Select choice or q to quit:'

# -------------------------------------

select opt in "${options[@]}"
do
    case $opt in
        "Build contianers $docker_name and goaccess")
            build_dockers
            ;;
        "Run   contianers $docker_name and goaccess")
            run_dockers
            ;;
        *) echo "Bye bye Bro , have a nice day :) "; break;;
    esac
done



