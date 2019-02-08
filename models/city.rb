require_relative("../db/sql_runner.rb")

class City

  attr_reader :name, :visited, :country_id

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

end
