require_relative("../db/sql_runner.rb")

class City

  attr_reader :id
  attr_accessor :name, :visit_status, :country_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visit_status = details['visit_status']
    @country_id = details['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities (name, visit_status, country_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @visit_status, @country_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE cities SET (name, visit_status, country_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @visit_status, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def country()
    country = Country.find(@country_id)
    return country
  end

  def City.find_by_status(visit_status)
    sql = "SELECT * FROM cities WHERE visit_status = $1"
    values = [visit_status]
    city_data = SqlRunner.run(sql, values)
    result = map_data(city_data)
    return result
  end

  def City.all()
    sql = "SELECT * FROM cities"
    city_data = SqlRunner.run(sql)
    cities = map_data(city_data)
    return cities
  end

  def City.find_by_id(id)
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return false if result.nil?
    city = City.new(result)
    return city
  end

  def City.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def City.delete_by_id(id)
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def City.map_data(city_data)
    return city_data.map {|city| City.new(city)}
  end

end
