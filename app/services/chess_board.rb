class ChessBoard

  def initialize(n, m)
    @cols = n
    @rows = m
    @elements = n*m
    @board=[]
  end

  def generate_board
    generate_array_elements
    print_board
  end

  private

  def generate_array_elements

    (0..@elements-1).each do |element|
      element%2==0 ? @board.push(0) : @board.push(1)
    end

  end

  def print_board

    html=''
    array_rows=@board.each_slice(@cols ).to_a
    array_rows.each do |element_array|
      html += "<p>" + element_array.to_s + "</p>"
    end

    html

  end


end