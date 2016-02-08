class ClientsController < ApplicationController
  #it calls set_client before show, edit, update or destroy action
  before_action :set_client, only: [:show,:edit,:update,:destroy, :total_billed_amount, :amount_of_bills]
  before_action :set_genders, only: [:new, :edit, :show, :create, :update]

  # GET /clients
  def index
    @clients = Client.all
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/total_billed_amount_of
  def total_billed_amount
    @year = Integer params[:year]
    @amount = @client.total_billed_amount_collected_in @year
    render json: @amount
  end

  # GET /clients/1/amount_of_bills_in
  def amount_of_bills
    @month = Integer params[:month]
    @amount = @client.amount_of_bills_issued_in @month
    render json: @amount
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new (client_params)
    if @client.save
      @contact_info = ContactInfo.new do |c|
          c.name = "email"
          c.value = params[:email]
          c.client_id = @client.id
      end
      if @contact_info.save
        redirect_to @client, notice: t('successfully_created',obj: t('client'))
      end
    else
      @email = params[:email]
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: t('successfully_updated',obj: t('client'))
    else
      #It renders the edit.html.erb template belonging to the same controller.
      render :edit
    end
  end

  # DELETE  /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: t('successfully_destroyed',obj: t('client'))
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  def set_genders
      @genders = [[t('male'),"M"],[t('female'),"F"]]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:first_name, :last_name, :birthday, :gender, :email, :dni, :cuit)
  end
