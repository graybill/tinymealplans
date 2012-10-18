module ScheduleHelper

  def default_accordion_group(meal)
    # Open today
    return true if DateTime.now.strftime("%Y-%m-%d") == meal.date.strftime("%Y-%m-%d")
    # Or open next day
    return true if (DateTime.now + 1.day).strftime("%Y-%m-%d") == meal.date.strftime("%Y-%m-%d")
  end

  def food_icon(food)
    url = ""
    icons = Dir.glob(Rails.root + "public/food-icons/*.gif")
    icons.each do |icon|
      icon_name = File.basename(icon).split(".")[0]
      # match icon_name to food.name
      r = Regexp.new(food.name.underscore.singularize)
      if icon_name.underscore =~ r || food.name.underscore =~ Regexp.new(icon_name.underscore)
        url = "/food-icons/#{icon_name}.gif"
      end
    end
    url
  end

end
