class MissingNumberController < ApplicationController
  def index
  end

  def find_missing_number

    if params[:sequence]
      size=params[:sequence].split(':')[0].to_i
      seq=params[:sequence].split(':')[1].split(',').to_a
      @missing_bumber=MNumber.new(size,seq)
    end
  end

end
