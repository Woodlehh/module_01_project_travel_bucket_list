require_relative("../db/sql_runner.rb")

class Country

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO countries (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE countries SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def Country.all()
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    countries = map_data(country_data)
    return countries
  end

  def Country.find_by_id(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return false if result.nil?
    country = Country.new(result)
    return country
  end

  def Country.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def Country.delete_by_id(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Country.map_data(country_data)
    return country_data.map {|country| Country.new(country)}
  end

end
