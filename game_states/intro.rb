class Intro < GameState
  def initialize
    super
    #Sound["opening.wav"].play
    self.input = {:return => Play}
  end
  def draw
    super
    Image["intro.png"].draw(0, 0, 0)
  end
end