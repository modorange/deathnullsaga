class Intro < GameState
  def initialize
    super
    @music = Gosu::Song.new("media/baal.wav")
    @music.play
    self.input = {:return => Play}
  end
  def draw
    super
    Image["intro.png"].draw(0, 0, 0)
  end
end