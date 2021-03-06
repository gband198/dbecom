class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all.order("created_at DESC")

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
      if @order.save
        params["product"].each do |options|
          OrderProduct.create(order_id:@order.id, product_id:options)
        end
        render json: @order, status: :created, location: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end
#params["products"] do |key, options|
 #       OrderProduct.create(order_id:@order.id, product_id:options)
  #    end
      #if @order.save
      #params.each do |key, options|
        #if key.include?("product") 
        
        #OrderProduct.create(order_id:@order.id, product_id:options)
       #end
      #end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.permit(:name, :username, :address, :cardnum, :email, :status)
    end
end
