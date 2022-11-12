module Lib
    @key = 0
    @text = ""
    @result = ""

    def self.show_main_info
        puts "To encrypt text, enter <e>"
        puts 'To dencrypt text, enter <d>'
        puts "To quit, enter <q>"
    end

    def self.get_encrypted_scanario()
        set_key
        set_text
        show_key_and_text
        get_encrypted
        puts "Result: " + @result
        puts
    end

    def self.get_decrypted_scanario()
        set_key
        set_text
        show_key_and_text
        get_decrypted
        puts "Result: " + @result
        puts
    end

    def self.show_key_and_text
        puts
        puts "Key: " + @key.to_s + "; Text: " + @text + ";"
    end

    def self.set_key
        print "Please, enter you key: "
        @key = gets.chomp.to_i
        p "Your key is => #{@key}"
    end

    def self.set_text
        print "Please, enter you text: "
        @text = gets.chomp
        p "Your text is => #{@text}"
    end

    def self.get_encrypted
        @result = @text.chars.map { |char| encrypt(char) }.join('')
    end

    def self.get_decrypted
        @result = @text.chars.map { |char| decrypt(char) }.join('')
    end

    def self.encrypt(symbol)
        Array.new(@key).reduce(symbol) { |acc, new| acc.next }
    end
    
    def self.decrypt(symbol)
        Array.new(@key).reduce(symbol) { |acc, new| (acc.ord - 1).chr }
    end
end


