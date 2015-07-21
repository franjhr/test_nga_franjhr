class MinesweeperController < ApplicationController
  def index
  end

  def count_mines

    if params[:sequence][:text]
      @mines=Minesweeper.new(params[:sequence][:text])
    end
  end
end
