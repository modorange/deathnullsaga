class Character < Chingu::GameObject
  
  traits :asynchronous, :velocity

  attr_accessor :screen_x, :screen_y

  def initialize(options = {})
    super

    @animation = Chingu::Animation.new(:file => options[:image])
    @animation.frame_names = {:up => 0..2, :down => 6..8, :right => 3..5, :left => 9..11}
    
    if options[:d]
      self.face(options[:d])
    else
      self.face('up')
    end

    @font = Gosu::Font.new($window, "Courier", 18)
    @string = ""

    @screen_x = @screen_y = 0
  end

  def move_left
    @screen_x -= 2
    @frame_name = :left
  end
  def move_right
   @screen_x += 2
  @frame_name = :right
  end
  def move_up
    @screen_y -= 2
    @frame_name = :up
  end

  def move_down
    @screen_y += 2
    @frame_name = :down
  end 

  def say_next
    @string = "next"
  end

  def say(string)
    @string = string
  end

  def face(direction)
    @frame_name = direction.to_sym
  end

  def draw
    super
    
    if @string.length > 0
      lines = "#{@string}\n    /".split("\n ")
      y = @y - 10 - (18 * lines.count)
      lines.each_with_index do |line, index|
        @font.draw(line, @x - 10, y + (18 * index), 1.0, 1.0, 1.0)
      end
    end
  end

  def update
    if @screen_x == @last_x and @screen_y == @last_y
      @image = @animation[@frame_name][1]
    else
      @image = @animation[@frame_name].next
    end
    @last_x, @last_y = @screen_x, @screen_y
  end

end