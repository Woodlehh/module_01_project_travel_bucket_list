require_relative("../db/sql_runner.rb")

class Country

  attr_reader :id, :name

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

end
