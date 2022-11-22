def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
    
    begin
        civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
        ).officials
    rescue
        'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
    end
    
    def save_thank_you_letter(id,form_letter)
    Dir.mkdir('output') unless Dir.exist?('output')
    
    filename = "output/thanks_#{id}.html"
    
    File.open(filename, 'w') do |file|
        file.puts form_letter
    end
end

def clean_phone(phone)
    replacements = {
        '-' => '',
        '.' => '',
        '(' => '',
        ')' => '',
        ' ' => '',
    }

    formatted_phone = phone.gsub(Regexp.union(replacements.keys), replacements)
    length = formatted_phone.length

    if (length == 11 && formatted_phone[0].eql?("1"))
        return formatted_phone[1...9]
    elsif length == 10
        return formatted_phone
    else
        return 'Bad phone format'  
    end
end

def parse_time_s(str)
    date, time = str.split(' ')
    month, day, year = date.split('/')
    hour, min = time.split(':')
    Time.new("20#{year}", month, day, hour, min, 0)
    # puts DateTime.strptime('2001-02-03T04:05:06+07:00', '%Y-%m-%dT%H:%M:%S%z')
    # puts DateTime.strptime('11/12/08 10:47', '%m/%d/%y %H:%M')
end

