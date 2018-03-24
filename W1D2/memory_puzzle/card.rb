class Card
  attr_reader :face_value
  attr_accessor :face_up

  def initialize(face_value, face_up = false)
    @face_value = face_value
    @face_up = face_up
  end

  def display_card
    if @face_up
      print @face_value
    else
      print "X"
    end
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(other_card)
    return true if other_card.face_value == @face_value
    false
  end
end
