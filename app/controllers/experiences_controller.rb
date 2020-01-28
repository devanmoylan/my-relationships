# frozen_string_literal: true

class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[edit update destroy]

  # GET /experiences/new
  def new
    @experience = the_person.experiences.build
  end

  # GET /experiences/1/edit
  def edit; end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = the_person.experiences.build(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Experience was successfully created.' }
        format.json { render user_person_path(the_user, the_person), status: :created, location: @experience }
      else
        format.html { render new_user_person_path(the_user) }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Experience was successfully updated.' }
        format.json { render user_person_path(the_user, the_person), status: :ok, location: @experience }
      else
        format.html { render edit_user_person_experience_path(the_user, the_person, @experience) }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to user_person_path(the_user, the_person), notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience ||= the_person.experiences.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def experience_params
    params.require(:experience).permit(:experience_type, :start_date, :end_date, :location, :description, :role, :current)
  end
end
