module Lib
    def self.show_main_info
        puts "To encrypt text, enter <e>"
        puts 'To dencrypt text, enter <d>'
        puts "To quit, enter <q>"
    end

    def self.execute_scanario(method)
        key = get_key
        text = get_text
        show_key_and_text(key, text)
        result = method.call(key, text)
        puts "Result: " + result
        puts
    end

    def self.get_key
        print "Please, enter you key: "
        gets.chomp.to_i
    end

    def self.get_text
        print "Please, enter you text: "
        gets.chomp
    end

    def self.show_key_and_text(key, text)
        puts
        puts "Key: " + key.to_s + "; Text: " + text + ";"
    end

    def self.get_encrypted(key, text)
        text.chars.map { |char| encrypt(key, char) }.join('')
    end

    def self.get_decrypted(key, text)
        text.chars.map { |char| decrypt(key, char) }.join('')
    end

    def self.encrypt(key, symbol)
        Array.new(key).reduce(symbol) { |acc, new| get_next(acc) }
    end
    
    def self.decrypt(key, symbol)
        Array.new(key).reduce(symbol) { |acc, new| get_previous(acc) }
    end

    def self.get_next(symbol)
        if symbol == 'z'
            'a'
        elsif symbol == 'Z'
            'A'
        elsif symbol == ' '
            ' '
        else
            symbol.next
        end
    end

    def self.get_previous(symbol)
        if symbol == 'a'
            'z'
        elsif symbol == 'A'
            'Z'
        elsif symbol == ' '
            ' '
        else
            (symbol.ord - 1).chr
        end
    end
end