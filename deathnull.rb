require 'rubygems'
require 'bundler/setup'

require 'chingu'
require 'gosu'
require 'gosu_tiled'
include Gosu
include Chingu

require_rel 'game_states/*'
require_rel 'game_objects/*'
require_rel 'game_scenes/*.rb'

class Game < Window
  def initialize
    super(800, 600)
    self.caption = "Deåth/Nüll Saga 死ゼロの伝説 Shi zero no densetsu"
    self.input = {:escape => :exit}
    push_game_state(Intro)
  end
end

Game.new.show