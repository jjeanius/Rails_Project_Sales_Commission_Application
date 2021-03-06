require 'pry'

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to @product
      else
        render :new
      end
  end

  def show
    set_product
  end

  def edit
    set_product
  end

  def update
    set_product
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy
      redirect_to products_path
  end


  private

  def set_product
    @product = Product.find_by(id: params[:id])
      if !@product
        redirect_to products_path
      end
  end

  def product_params
    params.require(:product).permit(:name, :description)
   end

end
