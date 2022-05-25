# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'csv'

CSV.foreach(Rails.root.join('lib/seed_csv/flights.csv'), headers: true) do |row|
  Flight.create( {
                   number: row['number'],
                  departureAirport: row['departure_airport'],
                   arrivalAirport: row['arrival_airport'],
                  businessPlaces: row['business_class_seats'].to_i,
                  ecoPlaces: row['economy_class_seats'].to_i,
                   date: row['departure_date'],
                  duration: row['duration'].to_i,
                } )
end

