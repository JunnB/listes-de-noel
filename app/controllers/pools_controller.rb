class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  def index
    @pools = Pool.all
    add_breadcrumb "Evenements"
  end

  def show
    @gifts = @pool.gifts
    add_breadcrumb "Evenements", pools_path
    add_breadcrumb @pool.name
  end

  def new
    @pool = Pool.new
    @gifts = @pool.gifts
    add_breadcrumb "Evenements", pools_path
    add_breadcrumb "Créer un nouvel événement"
  end

  def edit
  end

  def join
    @pool = Pool.find(params[:pool_id])
    @user = User.find(params[:user_id])
    @pool.users << @user
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("pool_#{params[:pool_id]}", partial: "pools/line", locals: { pool: @pool }) }
      format.html { redirect_to pools_url, notice: "Successfully joined the pool." }
    end
  end

  def unjoin
    @pool = Pool.find(params[:pool_id])
    @user = User.find(params[:user_id])
    @pool.users.delete(@user)
    # redirect_to pools_path
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("pool_#{params[:pool_id]}", partial: "pools/line", locals: { pool: @pool }) }
      format.html { redirect_to pools_url, notice: "Successfully unjoined the pool." }
    end
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save
      redirect_to @pool, notice: "Pool was successfully created."
    else
      render :new
    end
  end

  def update
    if @pool.update(pool_params)
      redirect_to @pool, notice: "Pool was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pool.destroy
    redirect_to pools_url, notice: "Pool was successfully destroyed."
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:name)
  end
end
