class ItemsController < ApplicationController
  before_action :current_user_must_be_item_seller, only: [:edit, :update, :destroy] 

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@items.where.not(:location_latitude => nil)) do |item, marker|
      marker.lat item.location_latitude
      marker.lng item.location_longitude
      marker.infowindow "<h5><a href='/items/#{item.id}'>#{item.title}</a></h5><small>#{item.location_formatted_address}</small>"
    end
  end

  # GET /items/1
  def show
    @message = Message.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      message = 'Item was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @item, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    message = "Item was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to items_url, notice: message
    end
  end


  private

  def current_user_must_be_item_seller
    set_item
    unless current_user == @item.seller
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :price, :description, :location, :image, :category_id, :seller_id, :is_sold)
    end
end
