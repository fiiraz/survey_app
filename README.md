# README

Survey APP is a basic web application that allows you to create answers for surveys and take them.

#Ruby version
3.1.2

#Rails version
7.0.3.1

# Database creation and initialization
* db:create
* db:migrate
* db:seed

# Run the server docker container
* docker compose run web rake db:create db:migrate db:seed
* docker-compose up

# Get the id of the survey you want to take
* docker compose run web rails c
* Survey.last.id