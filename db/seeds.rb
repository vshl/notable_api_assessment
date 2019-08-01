# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.create(first_name: 'John', last_name: 'Smith')
doctor = Doctor.first
Appointment.create(doctor_id: doctor.id, patient_first_name: 'Jane', patient_last_name: 'Doe', visit: 2.hours.ago, kind: true)
Appointment.create(doctor_id: doctor.id, patient_first_name: 'Jack', patient_last_name: 'Doe', visit: 1.day.ago, kind: false)
