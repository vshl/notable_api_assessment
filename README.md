# README

Sample rails application. Here are the instructions to get started

bundle install

bundle exec rails db:migrate

bundle exec rails db:seed

bundle exec rails server

Open URL: http://localhost:3000 in web browser

## Supported routes

POST requests accepts json

GET api/v1/doctors

GET api/v1/doctors/1

POST api/v1/doctors

DELETE api/v1/doctors/1

GET api/v1/doctors/1/appointments

POST api/v1/doctors/1/appointments

DELETE api/v1/doctors/1/appointments/1

Example JSON for appointment:

{
	"doctor_id": "1",
	"patient_first_name": "Bruce",
	"patient_last_name": "Wayne",
	"visit": "2019-08-01 14:00:00",
	"kind": "true"
}
