class ClientsController < ApplicationController
  #it calls set_client before show, edit, update or destroy action
  before_action :set_client, only: [:show,:edit,:update,:destroy]

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

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new (client_params)
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      #It renders the edit.html.erb template belonging to the same controller.
      render :edit
    end
  end

  # DELETE  /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:first_name, :last_name, :birthday, :gender, :dni, :cuit, :email, :address, :telephone, :skype, :facebook)
  end
