class PeopleController < ApplicationController
  #it calls set_person before edit, update or destroy action
  before_action :set_person, only: [:edit, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_url, notice: t('successfully_created',obj: t('person'))
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
      if @person.update(person_params)
        redirect_to people_url, notice: t('successfully_updated',obj: t('person'))
      else
        render :edit
      end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: t('successfully_destroyed',obj: t('person'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :cuit, :legal)
    end
end
