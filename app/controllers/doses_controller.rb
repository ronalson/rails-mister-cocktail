class DosesController < ApplicationController

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render cocktail_path(@dose.cocktail)
    end
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end
end
