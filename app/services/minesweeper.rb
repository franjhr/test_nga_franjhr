require 'Matrix'

class Minesweeper

  def initialize(sequence)
    @seq = sequence.split("\r\n")
    @matrix = Matrix[]
    @array_count_mines=[]
    @cols=0
    @rows=0
  end

  def generate_minesweeper
    generate_matrix
    convert_matrix_in_count_mines_matrix
    print_count_mines
  end

  private

  def generate_matrix

    @rows=@seq.size

    @seq.each do |line|
      @cols=line.split(" ").size
      @matrix = Matrix.rows(@matrix.to_a << line.split(" ").to_a)
    end

  end

  def convert_matrix_in_count_mines_matrix

    @matrix.each_with_index do |element, row, col|


      if (element != 'x' && element != 'X' )

        count_mines=0

        #check arround element
        if col - 1 >= 0
          #west	oeste
          element_to_compare =(@matrix.element(row,col - 1)).to_s
          count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
        end

        if col + 1 < @cols
          #east	este
          element_to_compare =(@matrix.element(row,col + 1)).to_s
          count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
        end

        if (row - 1 >= 0)
          #north	norte
          element_to_compare = (@matrix.element(row - 1,col)).to_s
          count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )

          if col - 1 >= 0
            #northwest	noroeste
            element_to_compare =(@matrix.element(row - 1,col - 1)).to_s
            count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
          end

          if col + 1 < @cols
            #northeast	noreste
            element_to_compare =(@matrix.element(row - 1,col + 1)).to_s
            count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
          end

        end


        if (row + 1 < @rows)
          #south	sur
          element_to_compare =(@matrix.element(row + 1,col)).to_s
          count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )

          if col - 1 >= 0
            #southwest	sudoeste
            element_to_compare =(@matrix.element(row + 1,col - 1)).to_s
            count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
          end

          if col + 1 < @cols
            ##southeast	sudeste
            element_to_compare =(@matrix.element(row + 1,col + 1)).to_s
            count_mines+=1 if (element_to_compare == 'x' || element_to_compare == 'X' )
          end

        end

        @array_count_mines.push(count_mines)

      else
        @array_count_mines.push('X')
      end

    end

  end

  def print_count_mines

    html=''
    i = 0
    @matrix.each do |element|
      html += "<label>" + element.to_s + "</label>"
      i+= 1
      if i == @matrix.column_size
        html += "<br>"
        i = 0
      end
    end

    html += "<p>Result:</p>"

    array_mines=@array_count_mines.each_slice(@cols).to_a
    array_mines.each do |element_array|
      html += "<p>" + element_array.to_s + "</p>"
    end

    html

  end


end