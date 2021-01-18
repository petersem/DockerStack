# run 'source ~/.bashrc' to load latest changes in current session

# ALIASES #####################################################

# Set docker aliases
alias cdkr='cd /volume1/docker'
alias list='sudo docker ps -a'
alias down='sudo docker-compose down -v'
alias up='sudo docker-compose up -d'
alias inspect='sudo docker inspect'
alias create='sudo docker-compose up --no-start'
alias stop='sudo docker stop'
alias start='sudo docker start'
alias prune='sudo docker system prune -a'

# FUNCTIONS ####################################################

# Opens a bash shell, given a supplied container name
#
term() {
  sudo docker exec -it $1 /bin/bash
}

# Shows 'port in use' details for a supplied port number
#
piu() {
  sudo netstat -plan | grep ":$1"
}

# ENVIRONMENT SETTINGS ##########################################
#
# Helps avoid timeouts for large yaml scripts
export DOCKER_CLIENT_TIMEOUT=360
export COMPOSE_HTTP_TIMEOUT=360
