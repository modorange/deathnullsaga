class Player < Character
  def initialize(options = {})
    super
  end
  
  def move_left
    @x -= 2
    @frame_name = :left
  end
  def move_right
   @x += 2
  @frame_name = :right
  end
  def move_up
    @y -= 2
    @frame_name = :up
  end

  def move_down
    @y += 2
    @frame_name = :down
  end 

  def say(string)
    @string = string
  end

  def draw
    super
    @font.draw(@string, @x - 20, @y - 40, 1.0, 1.0, 1.0)
  end

  def update
    @image = @animation[@frame_name].next
  end


end