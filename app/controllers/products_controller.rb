class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all.order("created_at DESC")

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    #@product.image.attach(params[:image])
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  # GET /search
  def search
      products = nil
      if !params[:input].nil?
        params[:input] = params[:input].downcase if params[:input].is_a?(String)
        # products = Product.search(params[:input])
        
        #products =  params[:input].is_a?(String)
        products = Product.search(params[:input])
      end
      if !params[:category].nil? and !products.nil?
          products = products.where(category:Category.find(params[:category])).order("created_at DESC")
      end
      if !params[:price_range].nil? and !products.nil?
        price_range = params[:price_range].split("-")
        products = products.where("price BETWEEN ? AND ?", price_range[0],  price_range[1]).order("created_at DESC")
      end
      if  !products.nil?
        render json: products, status: :ok
      else
        render json: {empty: 'no results'}, status: :unprocessable_entity
      end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :category_id, :price, :image, :description) #:image,
    end
end
