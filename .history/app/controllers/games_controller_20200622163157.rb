require 'open-uri'
require 'json'

class GamesController < ApplicationController
    def new
        @array = Array.new(10) { ('A'..'Z').to_a.sample }
    end
    def score
        @word = params[:word]
        if included?(@word.upcase, grid)
            if english_word?(@word)
              score = compute_score(attempt, time)
              [score, "well done"]
            else
              [0, "not an english word"]
            end
          else
            [0, "not in the grid"]
          end
    end
    
    def included?(guess, grid)
        guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
    end

    def english_word?(word)
        response = open("https://wagon-dictionary.herokuapp.com/#{word}")
        json = JSON.parse(response.read)
        return json['found']
    end
    
end
