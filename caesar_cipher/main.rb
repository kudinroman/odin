# caesar cipher
require_relative 'lib'
main_answer = ""

puts "It's Caesar Cipher App!"

while main_answer != 'q'
    Lib.show_main_info

    main_answer = gets.chomp

    case main_answer
        when 'e' then Lib.execute_scanario(Lib.method(:get_encrypted))
        when 'd' then Lib.execute_scanario(Lib.method(:get_decrypted))
        when 'q' then puts 'Bye!'
        else puts "It's a wrong symbol, try again"; puts;
  end
end