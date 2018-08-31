class ReviewsController < ApplicationController
  def index
    @reviews = Review.all 
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new 
  end

  def create
    @review = Review.new(reviews_params)
 
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  private

   def reviews_params
     params.require(:review).permit(:title, :author, :body)
   end
end
