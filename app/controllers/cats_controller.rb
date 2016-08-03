class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find_by_id(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if(@cat.save)
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    @cat = Cat.find_by_id(params[:id])    
    @cat.update(cat_params)

    if(@cat.save)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  protected

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
