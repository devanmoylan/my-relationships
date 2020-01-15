# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_user, only: %i[show new create edit update destroy index]
  before_action :set_person, only: %i[update]

  # GET /people
  # GET /people.json
  def index
    @people = @user.people
  end

  # GET /people/1
  # GET /people/1.json
  def show
    if params[:person_id]
      connection = Person.find(params[:person_id])
      @person = connection.connections.find(params[:id])
    else
      @person = @user.people.find(params[:id])
    end
  end

  # GET /people/new
  def new
    if params[:person_id]
      @person = Person.find(params[:person_id])
      @new_person = @person.connections.build
    else
      @new_person = @user.people.build
    end
  end

  # GET /people/1/edit
  def edit
    if params[:person_id]
      @connection = Person.find(params[:person_id])
      @person = @connection.connections.find(params[:id])
    else
      @person = @user.people.find(params[:id])
    end
  end

  # POST /people
  # POST /people.json
  def create
    if params[:person_id]
      @person = Person.find(params[:person_id])
      @new_person = @person.connections.create!(person_params)
    else
      @new_person = @user.people.create!(person_params)
    end

    respond_to do |format|
      if @new_person.persisted?
        format.html { redirect_to user_person_path(@user, @person), notice: 'Person was successfully created.' }
        format.json { render user_person_path(@user, @person), status: :created, location: @new_person }
      else
        format.html { render new_user_person_path(@user, @person) }
        format.json { render json: @new_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to user_person_path(@user, @person), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render edit_user_person_path(@user, @person) }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    if params[:person_id]
      connection = Person.find(params[:person_id])
      @person = connection.connections.find(params[:id])
      path = user_person_path(@user, connection)
    else
      @person = @user.people.find(params[:id])
      path = user_people_path(@user)
    end

    @person.destroy
    respond_to do |format|
      format.html { redirect_to path, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = @user.people.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :birthday)
  end
end
