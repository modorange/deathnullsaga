class Character < Chingu::GameObject
  def initialize(options = {})
    super

    @animation = Chingu::Animation.new(:file => options[:image])
    @animation.frame_names = {:up => 0..2, :down => 6..8, :right => 3..5, :left => 9..11}
    
    @frame_name = :up

    @font = Gosu::Font.new($window, "Courier", 18)
    @string = ""

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

  def say_next
    @string = "next"
  end

  def say(string)
    @string = string
  end

  def draw
    super
    lines = @string.split("\n ")

    y = @y - 40 - (18 * lines.count)

    lines.each_with_index do |line, index|
      @font.draw(line, @x - 20, y + (18 * index), 1.0, 1.0, 1.0)
    end
  end

  def update
    if @x == @last_x and @y == @last_y
      @image = @animation[@frame_name][1]
    else
      @image = @animation[@frame_name].next
    end

    @last_x, @last_y = @x, @y

  end

end