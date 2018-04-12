class DosesController < ApplicationController

def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new
end

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.create(dose_params)
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end
end

def destroy
  @dose = Dose.find(params[:id])
  @cocktail = @dose.cocktail
  @dose.destroy
  redirect_to cocktail_path(@cocktail)
end

private

def dose_params
  params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
end
end
