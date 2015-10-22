class Battle < GameState
  def initialize
    super

    Chingu::Text.trait :asynchronous


    @music = Gosu::Song.new("media/music/kostverloren.ogg")
    @music.play
    self.input = {:return => :attack}

    @tnuz = BattleCharacter.create(x: 100, y: 480, d: 'right', image: "tnuz_48x64.png")
    @arnie = BattleCharacter.create(x: 50, y: 520, d: 'right', image: "arnie_48x64.png")
    @knaap = BattleCharacter.create(x: 100, y: 560, d: 'right', image: "knaap_48x64.png")

    @buuf = BattleCharacter.create(x: 650, y: 480, d: 'left', image: "buur_48x64.png")
    @buur = BattleCharacter.create(x: 600, y: 520, d: 'left', image: "buur_48x64.png")
    @buuf2 = BattleCharacter.create(x: 650, y: 560, d: 'left', image: "buur_48x64.png")

    #@menu = SimpleMenu.create(:menu_items => {"Attack" => :attack, "Run" => :run})

    @players = [@tnuz, @arnie, @knaap]
    @enemies = [@buuf, @buur, @buuf2]

  end

  def attack
    @players.sample.attack(@enemies.sample)

  end

  def run
    puts 'run'
  end

  def draw
    super
    Image["battle.png"].draw(0, 0, 0)
  end
end