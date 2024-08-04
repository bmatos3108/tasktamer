# app/controllers/groceries_controller.rb
class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def new
    @grocery = Grocery.new
  end

  def create
    @grocery = Grocery.new(grocery_params)
    if @grocery.save
      redirect_to groceries_path, notice: 'Grocery was successfully created.'
    else
      render :new
    end
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :quantity)
  end
end
