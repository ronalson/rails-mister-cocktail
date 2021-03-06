class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
    @cocktail.doses.build # initialize empty doses collection
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :index
    end
  end

  def show
    @ingredients = Ingredient.order(:name).all
    @dose = Dose.new
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :directions, :photo, :photo_cache,
                                     doses_attributes: [:id, :ingredient_id, :quantity, :_destroy])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
