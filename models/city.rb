class City

  attr_reader :id, :name, :country_id

  def initalize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

end
