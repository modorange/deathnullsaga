class Play < GameState
  def initialize
    super

    @scene = YAML.load_file("scenes/01_briljant.yml")
    @music = Gosu::Song.new("media/music/#{@scene['music']}.ogg")
    @music.play

    @player = Character.create(x: 200, y: 200, image: 'tnuz_48x64.png')
    
    @characters = {'player' => @player}

    @scene['characters'].each do |name, coordinates|
      @characters[name] = Character.create(x: coordinates['x'], y: coordinates['y'], image: "#{name}_48x64.png")
    end

    @font = Gosu::Font.new($window, "Courier", 18)

    @string

    @zoom = 1.0

    @index = 0

    @script = @scene['dialog']

    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left, 
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right, 
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up, 
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down
                    }
    self.input = {
      r: :say_next,
      holding_q: :zoom_in,
      holding_w: :zoom_out
    }
  end

  def zoom_in
    @zoom += 0.05
  end

  def zoom_out
    @zoom -= 0.05
  end

  def say_next
    @characters.each do |key, value|
      value.say ''
    end

    unless @script[@index].nil?
      @script[@index].each do |key, value|
        @characters[key].say value
      end
      @index += 1
    end
    
  end

  def draw
    scale(@zoom, @zoom, @player.x, @player.y) do
      super
      Image["level.png"].draw(-400, -100, 0)
    end
  end
end