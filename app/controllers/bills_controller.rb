class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :set_people, only: [:new, :edit]
  before_action :set_client, only: [:index, :show, :edit]

  # GET /bills
  def index
    @bills = @client.bills
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @bill.client = Client.find(params.require (:client_id))
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)
      if @bill.save
        redirect_to client_bill_path(@bill.client, @bill), notice: 'Bill was successfully created.'
      else
         render :new
      end
  end

  # PATCH/PUT /bills/1
  def update
      if @bill.update(bill_params)
        redirect_to client_bill_path(@bill.client, @bill), notice: 'Bill was successfully updated.'
      else
         render :edit
      end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to client_bills_path(@bill.client), notice: 'Bill was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:client_id, :person_id, :description, :total_amount, :issue_date)
    end

    def set_people
      @people = Person.pluck(:name, :id)
    end

    def set_client
      @client = Client.find(params.require :client_id)
    end
end
