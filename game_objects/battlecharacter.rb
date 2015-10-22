class BattleCharacter < Character
	
  def initialize(options = {})
		super
		@target = nil
		@startx, @starty = @x, @y
		@attacking = false
	end

	def attack(target)

		return if @attacking

		@attacking = true

		@target = target

    self.async do |q|
      q.tween(1000, x: target.x - 40, y: target.y)
      q.call :hit
      q.wait 800
      q.tween(1000, x: @startx, y: @starty)
      q.call :done
    end
	end

	def done
		@attacking = false
	end

	def hit

    weapon = Sprite.create(image: 'guitar.png', x: @x + 15, y: @y - 5, angle: 280)
    weapon.factor_x = -1

 		text = Chingu::Text.create("-10hp", x: @target.x - 10, y: @target.y - 50)

    weapon.async do |q|
      q.wait 200
      q.tween(100, angle: 360)
      q.tween(200, angle: 280)
      q.tween(100, angle: 360)
      q.call :destroy
    end

    starty = @target.y

    @target.async do |q|
      q.wait 1000
      q.tween(100, y: starty + 10, angle: 10)
      q.tween(100, y: starty, angle: 0)
    end

    text.async do |q|
      q.wait 1000
      q.tween(1500, :alpha => 0, :scale => 3)
      q.call :destroy
    end

	end

  def update
    if @x == @last_x and @y == @last_y
      @image = @animation[@frame_name][1]
    else
      @image = @animation[@frame_name].next
    end
    @last_x, @last_y = @x, @y
  end



end
