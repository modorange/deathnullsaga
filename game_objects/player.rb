class Player < Chingu::GameObject
  def initialize(options = {})
    super
    #@image = Image["arnie_48x72.png"]

    #@animation = Chingu::Animation.new(:file => "knaap_48x64.png")
    #@animation = Chingu::Animation.new(:file => "arnie_48x64.png")
    @animation = Chingu::Animation.new(:file => "tnuz_48x64.png")
    @animation.frame_names = {:up => 0..2, :down => 6..8, :right => 3..5, :left => 9..11 }
    
    @frame_name = :up

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

  def update
    @image = @animation[@frame_name].next
  end

end