class Intro < GameState
  def initialize
    super
    @music = Gosu::Song.new("media/music/baal.ogg")
    @music.play
    self.input = {:return => :start}
  end

  def start
    @music.stop
    $window.push_game_state(Play)
  end

  def draw
    super
    Image["intro.png"].draw(0, 0, 0)
  end
end