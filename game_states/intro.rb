class Intro < GameState
  def initialize
    super
    Sound["baal.wav"].play

    # @music = Gosu::Song.new(self, "media/music/baal.mp3")
    # @music.play
    self.input = {:return => Play}
  end
  def draw
    super
    Image["intro.png"].draw(0, 0, 0)
  end
end