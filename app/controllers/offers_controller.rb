class OffersController < ApplicationController
  def index
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @pool = @gift.pool
    @offer = Offer.new(gift: @gift, user: current_user)
  end

  def edit
    @offer = Offer.find(params[:id])
    @gift = @offer.gift
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      @gift.buyers << current_user if @offer.is_buyer
      redirect_to pool_path(@offer.gift.pool)
    else
      say @offer.errors.messages
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.save
      @gift.buyers << current_user if params[:buyer] == "true"
      redirect_to pool_path(@gift.pool)
    else
      render :edit
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :gift_id, :comment, :status, :is_buyer)
  end
end
