require 'open-uri'
require 'json'

class GamesController < ApplicationController
    def new
        @array = Array.new(10) { ('A'..'Z').to_a.sample }
    end
    def score
        @word = params[:word]
        @array = params[:value]
        if included?(@word.upcase, @array)
            if english_word?(@word)
                @message = "Congratulations! #{@word} is an english word."
            else
                @message = "Sorry but #{@word} is not an english word."
            end
          else  @message = "Sorry but test can't be built out"
          end
    end
    
    def included?(guess, grid)
        raise
        guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
    end

    def english_word?(word)
        response = open("https://wagon-dictionary.herokuapp.com/#{word}")
        json = JSON.parse(response.read)
        return json['found']
    end
    
end
