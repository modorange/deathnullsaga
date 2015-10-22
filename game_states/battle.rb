class Battle < GameState
  def initialize
    super

    Chingu::Text.trait :asynchronous

    @camera = Sprite.create

    @music = Gosu::Song.new("media/music/kostverloren.ogg")
    @music.play
    self.input = {:return => :attack, [:left, :down] => :next_target, [:right, :up] => :previous_target}

    @tnuz = BattleCharacter.create(x: 100, y: 480, d: 'right', image: "tnuz_48x64.png")
    @arnie = BattleCharacter.create(x: 50, y: 520, d: 'right', image: "arnie_48x64.png")
    @knaap = BattleCharacter.create(x: 100, y: 560, d: 'right', image: "knaap_48x64.png")

    @buuf = BattleCharacter.create(x: 650, y: 480, d: 'left', image: "buur_48x64.png")
    @buur = BattleCharacter.create(x: 600, y: 520, d: 'left', image: "buur_48x64.png")
    @buuf2 = BattleCharacter.create(x: 650, y: 560, d: 'left', image: "buur_48x64.png")

    #@menu = SimpleMenu.create(:menu_items => {"Attack" => :attack, "Run" => :run})

    @players = [@tnuz, @arnie, @knaap]
    @enemies = [@buuf, @buur, @buuf2]

    @zoom = 2
    @attacker = @tnuz
    @target = @enemies.first
    @target_index = 0

    @pointer = Sprite.create(image: 'arrow_down.png')

  end

  def next_target
    @target_index += 1
    if @target_index >= @enemies.count
      @target_index = 0
    end

    @target = @enemies[@target_index]

    @pointer.x = @target.x
    @pointer.y = @target.y - 30
  end

  def previous_target
    @target_index -= 1
    if @target_index < 0
      @target_index = @enemies.count - 1
    end
    @target = @enemies[@target_index]

    @pointer.x = @target.x
    @pointer.y = @target.y - 30
  end

  def attack

    @camera.async do |q|
      q.tween(1000,:scale => 1.5)
      q.wait 500
      q.tween(1000,:scale => 1)
    end

    @attacker = @players.sample
    @attacker.attack(@target)
  end

  def run
    puts 'run'
  end

  def draw
    scale(@camera.scale, @camera.scale, @attacker.x + 50, @attacker.y - 50) do
      super
      Image["battle.png"].draw(0, 0, 0)
    end
  end

end