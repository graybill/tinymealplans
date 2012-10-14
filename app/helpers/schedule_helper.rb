module ScheduleHelper

  def default_accordion_group(meal)
    # Open today
    return true if DateTime.now.strftime("%Y-%m-%d") == meal.date.strftime("%Y-%m-%d")
    # Or open next day
    return true if (DateTime.now + 1.day).strftime("%Y-%m-%d") == meal.date.strftime("%Y-%m-%d")
  end

end
