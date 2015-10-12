require 'chingu'
include Gosu
include Chingu

require_rel 'game_states/*'
require_rel 'game_objects/*'

class Game < Window
  def initialize
    super(800, 600, full_sreen: true)
    self.caption = "Deåth/Nüll Saga 死ゼロの伝説 Shi zero no densetsu"
    self.input = {:escape => :exit}
    push_game_state(Intro)
  end
end

Game.new.show