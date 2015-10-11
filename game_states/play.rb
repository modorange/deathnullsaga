class Play < GameState
  def initialize
    super

    @player = Character.create(x: 200, y: 200, image: 'tnuz_48x64.png')

    @arnie = Character.create(x: 254, y: 100, image: 'arnie_48x64.png')
    @knaap = Character.create(x: 324, y: 100, image: 'knaap_48x64.png')

    @font = Gosu::Font.new($window, "Courier", 18)

    @string

    @script = [

      
      [@player, "He knapen, alles goed?"],
      
      [@knaap, "Het gaat slecht, maar verder gaat het goed"],
      [@arnie, "Kun je niet ergens anders gaan zitten?\n Je bent zeiknat!"],


      [@player, "Ja. Omdat het in HAARLEM ALTIJD REGENT!!!"],
      [@arnie, "Het regent altijd alleen maar als jij er bent..."],
      [@knaap, "In het Hearlemfe stellen we prijs op onze rust.\n Heel anders dan die Lugubere Feesttent\n waar jij vandaan komt!"],
      [@knaap, "Maar weet je waar het helemaal gedaan is met de rust?\n In Schoten!"],


      [@player, "Hoezo dat dan?"],
      [@knaap, "Arnie heeft een basgitaar gekocht!"],
      [@player, "Een basgitaar? waarom dat opeens?"],
      [@knaap, "KIM DEAL"],
      [@arnie, "..."],

      [@player, "Speelde jij geen gitaar vroeger, knaap?"],
      [@knaap, "Jazeker, in het rampjaar.."],
      [@player, "Ja ja rampjaar 1992 Arnhem rotjeugd blabla.\n Ik heb thuis ook nog een gitaar liggen.\n We gaan een band beginnen!"],
      [@arnie, "AWESOME!!!"],
      [@knaap, "Hmmm puik plan. We moeten een naam hebben.."],

      [@knaap, "..."],
      [@knaap, "Loden plaat die langzaam neerdaalt op mijn ziel?"],
      [@player, "..."],
      [@knaap, "De Blauwe Eierkokers?"],
      [@arnie, "..."],
      [@knaap, "Het moet iets met leegte zijn,\n een zwart gat.. Dev/Null..."],
      [[@arnie, @player], "Deåth/Nüll!!!!"]

    ]

    @index = 0

    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left, 
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right, 
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up, 
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down
                    }
    self.input = {r: :say_next}
  end

  def say_next
    @arnie.say ''
    @knaap.say ''
    @player.say ''

    unless @script[@index].nil?

      actors = @script[@index].first
        if actors.is_a? Array
          actors.each do |actor|
            actor.say @script[@index][1]
          end
        else
          actors.say @script[@index][1]
        end
      @index += 1
    end
    
  end

  def draw
    super
    Image["level.png"].draw(-400, -100, 0)
  end
end