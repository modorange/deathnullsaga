class Scene < GameState
  def initialize
    super

    @scene = YAML.load_file("game_scenes/01_briljant.yml")
    
    @font = Gosu::Font.new($window, "Courier", 18)

    @string

    @zoom = 1.0

    @index = 0

    self.input = {
      r: :say_next,
      holding_q: :zoom_in,
      holding_w: :zoom_out
    }
  end

  def init_scene

    @music = Gosu::Song.new("media/music/#{@scene['music']}.ogg")
    @music.play

    @characters = {}
    
    @scene['characters'].each do |name, coordinates|
      character = Character.create(x: coordinates['x'], y: coordinates['y'], image: "#{name}_48x64.png")
      character.face(coordinates['d'])
      @characters[name] = character
    end

    @script = @scene['dialog']
    @image = Image["map_#{@scene['map']['image']}.png"]

    @mapx =  @scene['map']['x']
    @mapy =  @scene['map']['y']

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

    if @player.nil?
      x = 0
      y = 0
    else
      x = @player.x
      y = @player.y
    end

    scale(@zoom, @zoom, x, y) do
      super
      @image.draw(@mapx, @mapy, 0)
    end
  end
end