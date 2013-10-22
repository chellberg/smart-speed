class GuessesController < ActionController::Base
  
  def new
     @guess = Guess.new
  end
  
  def show
    @guess = Guess.find(params[:id])  
  end
  
  def index
    @guesses = Guess.find()
  end
  
  def create  
  end
  
  def updated
  end
  
  def destroy
    @guess = Guess.find(params[:id])
    @guess.destroy
  end
  
end
  
  