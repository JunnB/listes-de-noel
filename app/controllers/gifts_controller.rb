class GiftsController < ApplicationController
  def index
  end

  def new
    @gift = Gift.new
    @pool = Pool.find(params[:pool_id])
    add_breadcrumb "Evenements", pools_path
    add_breadcrumb "Créer un nouveau cadeau"
  end

  def show
    @gift = Gift.find(params[:id])
    @pool = @gift.pool
    add_breadcrumb "Evenements", pools_path
    add_breadcrumb @pool.name, pool_path(@pool)
    add_breadcrumb "Détails"
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.proposer = current_user
    if @gift.save
      redirect_to pool_path(@gift.pool)
    else
      render :new
    end
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(claimed: true)
    turbo_stream.replace :gifts_list, partial: "gifts_list", locals: { users: Users.all }
    head :ok
  end

  private

  def set_users
    @users = User.all
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :user_id, :price, :pool_id)
  end
end
