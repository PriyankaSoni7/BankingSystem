class BankController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @bank = Bank.new
    respond_to do |format|
      format.json { render json: { bank: @bank }, status: :ok }
    end
  end

  def show
    @bank = Bank.find(params[:id])
    respond_to do |format|
      format.json { render json: { bank: @bank }, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :not_found }
      end
  end

  def create
    @bank = Bank.new(bank_params)
    respond_to do |format|
      if @bank.save
        format.json { render json: { bank: @bank }, status: :created }
      else
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank = Bank.find(params[:id])
    respond_to do |format|
      @bank.destroy
      format.json { render json: {}, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
  end

  def index
    @banks = Bank.all
    respond_to do |format|
      format.json { render json: { banks: @banks }, status: :ok }
    end
  end

  def edit
    @bank = Bank.find(params[:id])
    respond_to do |format|
      format.json { render json: { bank: @bank }, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :not_found }
      end
  end

  def update
    @bank = Bank.find(params[:id])
    respond_to do |format|
      if @bank.update(bank_params)
        format.json { render json: { bank: @bank }, status: :ok }
      else
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
    rescue StandardError => e
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
  end

  private
    def bank_params
      params.require(:bank).permit(:name, :address)
    end
end