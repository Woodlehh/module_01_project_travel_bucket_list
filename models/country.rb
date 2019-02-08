class Country

  def initalize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @country_id = details['country_id'].to_i
  end

end
