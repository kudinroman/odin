# caesar cipher
require_relative 'lib'
main_answer = ""

p "It's Caesar Cipher App!"

while main_answer != 'q'
    Lib.show_main_info

    # puts
    # puts Array.new(3).reduce('a') { |acc, new| acc.next }
    # puts

    main_answer = gets.chomp

    case main_answer
        when 'e' then Lib.get_encrypted_scanario
        when 'd' then Lib.get_decrypted_scanario;
        when 'q' then puts 'Bye!'
        else puts "It's a wrong symbol, try again"; puts;
  end
end