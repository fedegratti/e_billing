class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :set_people, only: [:new, :edit]
  before_action :set_client, only: [:index, :show, :edit]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
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
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save

        format.html { redirect_to client_bill_path(@bill.client, @bill), notice: 'Bill was successfully created.' }
        #format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        #format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
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
      params.require(:bill).permit(:client_id, :person_id, :description, :total_amount)
    end

    def set_people
      @people = Person.pluck(:name, :id)
    end

    def set_client
      @client = Client.find(params.require :client_id)
    end
end
