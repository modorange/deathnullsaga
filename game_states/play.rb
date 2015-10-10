class Play < GameState
  def initialize
    super

    @player = Player.create(x: 200, y: 200, image: 'tnuz_48x64.png')

    #@arnie = NPC.create(x: 254, y: 100, image: 'arnie_48x64.png')
    #@knaap = NPC.create(x: 324, y: 100, image: 'knaap_48x64.png')


    #@arnie.say "This should be <c=ffff00>yellow</c>"

    @script = [
      {@arnie => "Lalala"},
      {@knaap => "Muh"}
    ]

    @index = 0

    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left, 
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right, 
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up, 
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down
                    }
    #self.input = {holding_r: :say_next}
  end

  def say_next
    @arnie.say ''
    @knaap.say ''

    @script[@index].keys.first.say @script[@index].values.first
    @index += 1
    
  end

  def draw
    super
    Image["level.png"].draw(-400, -100, 0)
  end
end