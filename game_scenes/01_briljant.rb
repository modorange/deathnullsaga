class Briljant < Scene
  def initialize
    super
    @scene = YAML.load_file("game_scenes/01_briljant.yml")
    init_scene
  end

  def init_scene
    super

    @player = Character.create(x: 200, y: 200, image: 'tnuz_48x64.png')
    

    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left, 
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right, 
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up, 
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down
                    }

    @characters['player'] = @player
  end


end