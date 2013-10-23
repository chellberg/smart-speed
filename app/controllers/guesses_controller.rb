class GuessesController < ApplicationController
  
  def new
     @guess = Guess.new
  end
  
  def show
    @guess = Guess.find(params[:id])
  end
  
  def index
    @guesses = Guess.paginate(page: params[:page])
  end
  
  def create
    @guess = Guess.new(params[:guess])
      if @guess.save
        flash[:success] = "Thanks for sharing your speed intuition with other not-slow drivers!"
        redirect_to @guess
      else
        render 'new'
      end   
  end
  
  def destroy
    @guess = Guess.find(params[:id])
    @guess.destroy
  end
  
end
  
  