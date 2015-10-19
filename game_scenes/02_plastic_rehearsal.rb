class PlasticRehearsal < Scene
  def initialize
    super
    @scene = YAML.load_file("game_scenes/02_plastic_rehearsal.yml")
    init_scene
  end
end