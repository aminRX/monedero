class BalanceInformationsController < ApplicationController
  before_action :set_balance_information, only: [:show, :edit, :update, :destroy]

  # GET /balance_informations
  # GET /balance_informations.json
  def index
    @balance_informations = BalanceInformation.all
  end

  # GET /balance_informations/1
  # GET /balance_informations/1.json
  def show
    @client = Client.find(params[:client_id])
    @balance = Balance.find(params[:balance_id])
    @balance_information = BalanceInformation.find(params[:id])
  end

  # GET /balance_informations/new
  def new
    @balance_information = BalanceInformation.new
  end

  # GET /balance_informations/1/edit
  def edit
    @balance_information = BalanceInformation.find(params[:id])
    @percent_catalog = @balance_information.percent_catalog
    @percent_catalogs = PercentCatalog.all
  end

  # POST /balance_informations
  # POST /balance_informations.json
  def create
    @balance_information = BalanceInformation.new(balance_information_params)

    respond_to do |format|
      if @balance_information.save
        format.html { redirect_to @balance_information, notice: 'Balance information was successfully created.' }
        format.json { render :show, status: :created, location: @balance_information }
      else
        format.html { render :new }
        format.json { render json: @balance_information.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @client = Client.find(params[:client_id])
    @balance = Balance.find(params[:balance_id])
    @balance_information = BalanceInformation.find(params[:id])
    @percent_catalog = PercentCatalog.find(params[:percent_catalog][:percent])
    if @balance_information.update({
                                     amount: params[:balance_information][:amount],
                                     note_number: params[:balance_information][:note_number],
                                     percent_catalog: @percent_catalog
                                   })
      flash[:balance_information_edited] = "Informacion de balance ha sido modificada."
      redirect_to client_balance_balance_information_path(@client.id, @balance.id, @balance_information.id)
    else
      flash[:balance_information_error] = "Informacion de balance no se ha podido modificar."
      redirect_to client_balance_balance_information_path(@client.id, @balance.id, @balance_information.id)
    end
  end

  # DELETE /balance_informations/1
  # DELETE /balance_informations/1.json
  def destroy
    @client = Client.find(params[:client_id])
    @balance = Balance.find(params[:balance_id])
    if @balance.update_attribute(:archived, true)
      redirect_to client_path(@client.id)
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance_information
      @balance_information = BalanceInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balance_information_params
      params.permit(:balance_information).require(:amount, :note_number)
    end

    def percent_catalog_params
      params.permit(:percent_catalog).require(:percent)
    end
end
