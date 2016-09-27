class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  def guess(char)
    if char.nil? || char.empty? || char =~ /[^A-Za-z]/ 
      raise ArgumentError 
    end 
    
    char = char.downcase
    if @word.include? char and !@guesses.include? char
      @guesses << char
    elsif @word.include? char and @guesses.include? char
      return false
    elsif !@word.include? char and !@wrong_guesses.include? char
      @wrong_guesses << char
    else
      return false
    end
    return true
  end

end
