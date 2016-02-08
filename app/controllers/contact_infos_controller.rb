class ContactInfosController < ApplicationController
  before_action :set_contact_info, only: [:edit, :update, :destroy]
  before_action :set_client, only: [:edit]

  # GET /contact_infos/new
  def new
    @contact_info = ContactInfo.new
    @contact_info.client = Client.find(params.require (:client_id))
  end

  # GET /contact_infos/1/edit
  def edit
  end

  # POST /contact_infos
  def create
    @contact_info = ContactInfo.new(contact_info_params)
      if @contact_info.save
        redirect_to client_path(@contact_info.client), notice: t('successfully_created',obj: t('contact_info'))
      else
        render :new
      end
  end

  # PATCH/PUT /contact_infos/1
  def update
      if @contact_info.update(contact_info_params)
        redirect_to client_path(@contact_info.client), notice: t('successfully_updated',obj: t('contact_info'))
      else
        render :edit
      end
  end

  # DELETE /contact_infos/1
  def destroy
    @contact_info.destroy
    redirect_to client_path(@contact_info.client), notice: t('successfully_destroyed',obj: t('contact_info'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_info
      @contact_info = ContactInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_info_params
      params.require(:contact_info).permit(:client_id, :name, :value)
    end

    def set_client
      @client = Client.find(params.require :client_id)
    end
end
