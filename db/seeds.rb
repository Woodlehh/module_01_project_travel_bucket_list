require('pry')
require_relative('../models/city.rb')
require_relative('../models/country.rb')

City.delete_all()
Country.delete_all()

country_1 = Country.new({'name' => 'England'})
country_2 = Country.new({'name' => 'Scotland'})
country_3 = Country.new({'name' => 'Wales'})
country_4 = Country.new({'name' => 'Northern Ireland'})
country_5 = Country.new({'name' => 'Ireland'})

country_1.save()
country_2.save()
country_3.save()
country_4.save()
country_5.save()

city_1 = City.new({
  'name' => 'London',
  'visit_status' => 'Visited',
  'country_id' => country_1.id
  })

city_2 = City.new({
  'name' => 'Manchester',
  'visit_status' => 'Want To Visit',
  'country_id' => country_1.id
  })

city_3 = City.new({
  'name' => 'Edinburgh',
  'visit_status' => 'Visited',
  'country_id' => country_2.id
  })

city_4 = City.new({
  'name' => 'Glasgow',
  'visit_status' => 'Not Visited',
  'country_id' => country_2.id
  })

city_5 = City.new({
  'name' => 'Cardiff',
  'visit_status' => 'Not Visited',
  'country_id' => country_3.id
  })

city_6 = City.new({
  'name' => 'Swansea',
  'visit_status' => 'Not Visited',
  'country_id' => country_3.id
  })

city_7 = City.new({
  'name' => 'Belfast',
  'visit_status' => 'Want To Visit',
  'country_id' => country_4.id
  })

city_8 = City.new({
  'name' => 'Derry',
  'visit_status' => 'Not Visited',
  'country_id' => country_4.id
  })

city_9 = City.new({
  'name' => 'Dublin',
  'visit_status' => 'Not Visited',
  'country_id' => country_5.id
  })

city_10 = City.new({
  'name' => 'Cork',
  'visit_status' => 'Not Visited',
  'country_id' => country_5.id
  })

city_1.save()
city_2.save()
city_3.save()
city_4.save()
city_5.save()
city_6.save()
city_7.save()
city_8.save()
city_9.save()
city_10.save()

cities = City.all()
countries = Country.all()
# visited_cities = City.visits('Visited')
# not_visited = City.visits('Not Visited')
# want_to_visit = City.visits('Want To Visit')
# country_1.name = 'United States'
# country_1.update()
#
# city_1.name = 'San Francisco'
# city_1.update()
#
# city_2.visit_status = 'Visited'
# city_2.update()
#
# city_3.country_id = country_1.id
# city_3.update()

binding.pry
nil
