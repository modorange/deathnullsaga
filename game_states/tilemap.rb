TILE_SIZE = 32

class TileMap < GameState
  def initialize
    super

    @player = Character.create(x: 400, y: 300, image: 'tnuz_48x64.png')
    
    self.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left, 
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right, 
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up, 
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down
                    }

    @map = Gosu::Tiled.load_json($window, 'maps/house.json')
    @mapx = @mapy = 0

  end

  def move_up
    @player.move_up if can_move_to?(@mapx + @player.x, @mapy + @player.y - 10)
  end

  def move_down
    @player.move_down if can_move_to?(@mapx + @player.x + 10, @mapy + @player.y)
  end

  def move_left
    @player.move_left if can_move_to?(@mapx + @player.x - 12 , @mapy + @player.y)
  end

  def move_right
    @player.move_right if can_move_to?(@mapx + @player.x + 10, @mapy + @player.y)
  end

  def update
    super
    @mapx = @player.screen_x
    @mapy = @player.screen_y

    tile_at((@mapx + @player.x) / 32, (@mapy + @player.y) /32)
  end

  def can_move_to?(x, y)
    tile = tile_at(x / 32, y / 32)
    tile == 0 || tile.nil?
  end

  def tile_at(x, y)
    layers = @map.layers
    puts layers.first.tile_at(x, y)
    layers.first.tile_at(x, y)
  end


  def draw
    super
    @map.draw(@mapx, @mapy)
  end


end