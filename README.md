# SURVEY CASE

Survey APP is a basic web application that allows you to create answers for surveys and take them.

## Ruby version
3.1.2

## Rails version
7.0.3.1

## Database creation and initialization
* db:create
* db:migrate
* db:seed

## Run the server docker container
* docker compose run web rake db:create db:migrate db:seed
* docker-compose up

## Get the id of the survey you want to take from docker
* docker compose run web rails c
* Survey.last.id

## Request examples
### GET /surveys/{id}
http://localhost:3000/api/v1/surveys/{id}
#### Response
```json
{
  "id": "e659051e-cec0-4446-943e-fb7926bc2a43",
  "name": "Pisano Survey",
  "questions": [
    {
      "id": "20c73b3c-8116-4d97-8eae-ff5b3e7b6a8f",
      "title": "How was your experience with us today?",
      "question_type": "choice",
      "options": [
        {
          "id": "9aebe09f-8245-4621-82d6-a68d0d35b8e8",
          "title": "Very Good"
        },
        {
          "id": "e00ddee4-f2df-4e81-9bc7-20097c757817",
          "title": "Good"
        },
        {
          "id": "991b93f3-e328-41cc-85dc-3d608a64c3e1",
          "title": "Neutral"
        },
        {
          "id": "35d67457-dc9a-4ce8-825e-f40e23ace8c1",
          "title": "Bad"
        },
        {
          "id": "dece7e9c-befe-42aa-9f43-c17a1c33d089",
          "title": "Very Bad"
        }
      ]
    },
    {
      "id": "730198d0-bf6e-4b40-87c5-e979c88347ea",
      "title": "Please explain the reason for your choice",
      "question_type": "text",
      "options": []
    }
  ]
}
```
### POST /surveys
http://localhost:3000/api/v1/surveys
#### Response
204
