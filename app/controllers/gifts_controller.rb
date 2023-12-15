class GiftsController < ApplicationController
  before_action :set_users, only: [:index, :create]
  def index
  end

  def create
    @gift = Gift.new(gift_params)
    if @gift.save
      turbo_stream.append :gifts_list, partial: "gift", locals: { gift: @gift }
      head :ok
    else
      render :index
    end
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(claimed: true)
    turbo_stream.replace :gifts_list, partial: "gifts_list", locals: { users: Users.all }
    head :ok
  end

  def show
    redirect_to user_sign_in_path unless current_user
    @gifts = current_user.gifts
  end

  private

  def set_users
    @users = User.all
  end

  def gift_params
    params.require(:gift).permit(:description, :user_id)
  end
end
