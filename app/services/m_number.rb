class MNumber

  def initialize(size, seq)
    @size = size
    @seq_order = seq.sort #order to seq
  end

  def find_missing_number_in_sequence
    generate_array_elements
  end

  private

  def generate_array_elements

    html=''
    @seq_order.each_with_index do |element, index|

      if element.to_i != (index+1)
        html = "<p>" + (index+1).to_s + " is the deleted item</p>"
        break
      end

    end

    html.blank? ? "<p> All numbers in sequence. </p>" : html

  end


end