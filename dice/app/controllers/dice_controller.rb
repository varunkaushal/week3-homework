class DiceController < ApplicationController #Inheritance for all controllers

	def play_game
		render "intro" #goes to Welcome Start Game page views/dice/intro.html.erb
		puts "intro"
		return
	end
	
	def start_game
		dice1 = ['1', '2', '3', '4', '5', '6']
		dice2 = ['1', '2', '3', '4', '5', '6']
		
		@d1 = dice1.sample(1)
		@d2 = dice2.sample(1)
		
		@sum = @d1.first.to_i + @d2.first.to_i
		
		if  @sum == 7 or @sum == 11
			render "win"
			puts "roll 1 win"
			return
		end
		
		if  @sum == 2 or @sum == 3 or @sum == 12
			render "lose"
			puts "roll 1 lose"
			return
		else
			render "rollagain"
			puts "roll 1 rollagain"
			return
		end
	end
	
	
	def re_roll
		dice1 = ['1', '2', '3', '4', '5', '6']
		dice2 = ['1', '2', '3', '4', '5', '6']
		
		@d1 = dice1.sample(1)
		@d2 = dice2.sample(1)
		
		@sum = params[:sum]
		puts @sum
		@sum2 = @d1.first.to_i + @d2.first.to_i
		
		if  @sum2 == 7 
			render "lose"
			puts "roll # lose"
			return
		end
		
		if  @sum.to_i == @sum2
			render "win"
			puts "roll # win"
			return
		else
			render "rollagain"
			puts "roll # rollagain"
			return
		end
	end
end
