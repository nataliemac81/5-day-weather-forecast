require 'barometer'

# Use the get method to accept a location from a user, and assign that location to a variable.
puts "Enter your city"
user_location = gets.chomp

# #Create a method that accepts the location as a parameter
def weather(user_location)
	barometer = Barometer.new(user_location)
	weather = barometer.measure
	tomorrow = Time.now.strftime('%d').to_i + 1

	weather.forecast.each do |forecast|
		day = forecast.starts_at.day

		if day == tomorrow
			dayName = 'Tomorrow'
		else 
			dayName = forecast.starts_at.strftime('%A')
		end

		puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
	end
end


puts weather(user_location)


