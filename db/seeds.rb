require('pry')
require_relative('../models/city.rb')
require_relative('../models/country.rb')

Country.delete_all
City.delete_all

country_1 = Country.new({"name" => "England"})
country_2 = Country.new({"name" => "Scotland"})
country_3 = Country.new({"name" => "Wales"})
country_4 = Country.new({"name" => "Northern Ireland"})
country_5 = Country.new({"name" => "Ireland"})

country_1.save()
country_2.save()
country_3.save()
country_4.save()
country_5.save()

city_1 = City.new({
  "name" => "London",
  "visit_status" => "visited",
  "country_id" => country_1.id
  })

city_2 = City.new({
  "name" => "Glasgow",
  "visit_status" => "want_to_visit",
  "country_id" => country_2.id
  })

city_3 = City.new({
  "name" => "Cardiff",
  "visit_status" => "not_visited",
  "country_id" => country_3.id
  })

city_1.save()
city_2.save()
city_3.save()

cities = City.all()
countries = Country.all()

binding.pry
nil
