class CreditcardController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @creditcard = Creditcard.new
    respond_to do |format|
      format.json { render json: { creditcard: @creditcard }, status: :ok }
    end
  end

  def show
    @creditcard = Creditcard.find(params[:id])
    respond_to do |format|
      format.json { render json: { creditcard: @creditcard }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @creditcard = Creditcard.new(creditcard_params)
    respond_to do |format|
      if @creditcard.save
        format.json { render json: { creditcard: @creditcard }, status: :created }
      else
        format.json { render json: @creditcard.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @creditcard = Creditcard.find(params[:id])
    respond_to do |format|
      @creditcard.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def index
    @creditcards = Creditcard.all
    respond_to do |format|
      format.json { render json: { creditcards: @creditcards }, status: :ok }
    end
  end

  def edit
    @creditcard = Creditcard.find(params[:id])
    respond_to do |format|
      format.json { render json: { creditcard: @creditcard }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    @creditcard = Creditcard.find(params[:id])
    respond_to do |format|
      if @creditcard.update(creditcard_params)
        format.json { render json: { creditcard: @creditcard }, status: :ok }
      else
        format.json { render json: @creditcard.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  
  private
    def creditcard_params
      params.require(:creditcard).permit(:card_no, :expiry_date, :issue_date, :cash_limit )
end
end
