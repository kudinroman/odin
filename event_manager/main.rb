require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require_relative 'lib/event_manager.rb'
require 'date'

puts 'Event Manager initialized.'
puts

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  #================================================================
  # MAIN TASK
  #================================================================

  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id,form_letter)
end

#================================================================
# Clean Phone Numbers
#================================================================

phones = []
CSV.foreach('event_attendees.csv', headers: :first_row) { |row| phones << row[5] }
clean_phones = phones.map { |phone| "#{phone} => #{clean_phone(phone)}" }
puts "Clean phones: => #{clean_phones}"
puts

#================================================================
# Time Targeting
#================================================================

dates = []
CSV.foreach('event_attendees.csv', headers: :first_row) { |row| dates << row[1] }
hours = dates.map { |date| parse_time_s(date).hour }

people_registered_hours = hours.reduce(Hash.new(0)) do |obj, hour|
        obj[hour] = obj[hour] += 1
        obj
    end

time_targeting = people_registered_hours.max_by { |hour, count| count }[0]
puts "People registered by hours: #{people_registered_hours}"
puts "Time Targeting => #{time_targeting}"
puts

#================================================================
# Day of the Week Targeting
#================================================================

people_registered_weekdays = dates
    .map { |date| parse_time_s(date) }
    .reduce(Hash.new(0)) do |obj, date|
        weekday = Date::DAYNAMES[date.wday]
        obj[weekday] = obj[weekday] += 1
        obj
end

weekday_targeting = people_registered_weekdays.max_by { |weekday, count| count }[0]
puts "People registered by weekdays: #{people_registered_weekdays}"
puts "Weekday Targeting => #{weekday_targeting}"
puts