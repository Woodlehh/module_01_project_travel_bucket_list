require_relative("../db/sql_runner.rb")

class City

  attr_reader :id, :name, :visit_status, :country_id

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

  def City.all()
    sql = "SELECT * FROM cities"
    city_data = SqlRunner.run(sql)
    cities = map_data(city_data)
    return cities
  end

  def City.find(id)
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def City.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def City.delete(id)
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def City.map_data(city_data)
    return city_data.map {|city| City.new(city)}
  end

end
