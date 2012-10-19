module UsersHelper


  def random_name
    @adjectives = ["dirty", "dry", "arid", "awkward", "ambitious", "benevolent", "controlling", "effective", "faulty", "gigantic", "holistic", "frustrated", "negative", "positive", "prolific"]
    @names = ["duck", "bobby", "sue", "billy", "diane", "milfred", "wilfred", "xander", "steven", "derek", "cindy", "sandra", "joseph", "nicole", "debbie", "juan", "ryan", "matt", "mike", "cecilia", "karen", "nancy", "megan", "mak", "john"]
    name = "#{@adjectives.sample}-#{@names.sample}"
    if User.find_by_handle(name)
      name = "#{name}-#{rand(1..1200)}"
    end
    name
  end

end
