# String#select
# Extend the string class by defining a String#select method that accepts a block. 
# The method should return a new string containing characters of the original string 
# that return true when passed into the block. If no block is passed, then return the 
# empty string. Do not use the built-in Array#select in your solution.
class String

    def select(&prc)
        res = ''
        return res if prc == nil
        
        self.each_char do |char|
            if prc.call(char)
                res += char
            end
        end
        res 
    end
end
# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""