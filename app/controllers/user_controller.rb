class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @user = User.new
    respond_to do |format|
      format.json { render json: { user: @user }, status: :ok }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: { user: @user }, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :not_found }
      end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: { user: @user }, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      @user.destroy
      format.json { render json: {}, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: { users: @users }, status: :ok }
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: { user: @user }, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :not_found }
      end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: { user: @user }, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    rescue StandardError => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
  end

  private
    def user_params
      params.require(:user).permit(:name, :address, :phone_no)
    end
end