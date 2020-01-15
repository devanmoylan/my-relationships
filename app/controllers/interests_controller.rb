# frozen_string_literal: true

class InterestsController < ApplicationController
  before_action :set_interest, only: %i[edit update destroy]

  # GET /interests/new
  def new
    @interest = the_person.interests.build
  end

  # GET /interests/1/edit
  def edit; end

  # POST /interests
  # POST /interests.json
  def create
    @interest = the_person.interests.build(interest_params)

    respond_to do |format|
      if @interest.save
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interest was successfully created.' }
        format.json { render user_person_path(the_user, the_person), status: :created, location: @interest }
      else
        format.html { render new_user_person_interest_path(the_user, the_person) }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interests/1
  # PATCH/PUT /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interest was successfully updated.' }
        format.json { render user_person_path(the_user, the_person), status: :ok, location: @interest }
      else
        format.html { render edit_user_person_interest_path(the_user, the_person, @interest) }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1
  # DELETE /interests/1.json
  def destroy
    @interest.destroy
    respond_to do |format|
      format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interest
    @interest = the_person.interests.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interest_params
    params.require(:interest).permit(:name, :level)
  end
end
