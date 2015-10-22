class Intro < GameState
  def initialize
    super
    @music = Gosu::Song.new("media/music/baal.ogg")
    @music.play
    self.input = {:return => :start}
  end

  def start
    @music.stop
    #$window.push_game_state(Briljant)
    #$window.push_game_state(TileMap)
    $window.push_game_state(Battle)
  end

  def draw
    super
    Image["intro.png"].draw(0, 0, 0)
  end
end