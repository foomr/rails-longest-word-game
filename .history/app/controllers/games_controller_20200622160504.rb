class GamesController < ApplicationController
    def new
        @Array.new(10) { ('A'..'Z').to_a.sample }
end
