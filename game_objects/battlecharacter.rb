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
      q.tween(1000, x: target.x - 50, y: target.y)
      q.call :hit
      q.wait 400
      q.tween(1000, x: @startx, y: @starty)
      q.call :done
    end
	end

	def done
		@attacking = false
	end

	def hit

 		text = Chingu::Text.create("-10hp", :x => @target.x - 10, :y => @target.y - 50)
    
    # Now, make that text object fade out and disappear asynchronously.
    text.async do |q|
      q.tween(1500, :alpha => 0, :scale => 3)
      q.call :destroy
    end

    starty = @target.y

    @target.async do |q|
      q.tween(100, y: starty + 10, angle: 10)
      q.tween(100, y: starty, angle: 0)
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
