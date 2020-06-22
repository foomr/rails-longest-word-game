class GamesController < ApplicationController
    def new
        @array = Array.new(10) { ('A'..'Z').to_a.sample }
    end
end
