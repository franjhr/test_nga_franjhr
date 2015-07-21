class ChessboardController < ApplicationController

  def index
  end

  def generate_chess_board

    if params[:cols] && params[:rows]
      cols=params[:cols].to_i
      rows=params[:rows].to_i
      @chess_board=ChessBoard.new(cols,rows)
    end
  end


end
