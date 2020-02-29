# frozen_string_literal: true

class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = the_user.people.includes([:avatar_attachment, :rich_text_notes, :experiences, :interests, :bonds, bonds: [:rich_text_notes]]).order(first_name: :asc)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = the_user.people.includes(
      [
        :avatar_attachment, :rich_text_notes, :mentions, :interactions, :interests, :bonds,
        bonds: [:rich_text_notes],
        mentions: [:rich_text_notes],
        interactions: [:rich_text_notes],
      ]
    ).find(params[:id])
  end

  # GET /people/new
  def new
    @person = the_user.people.build
  end

  # GET /people/1/edit
  def edit
    @person = the_user.people.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    person = the_user.people.create!(person_params)

    respond_to do |format|
      if person.persisted?
        format.html { redirect_to user_person_path(the_user, person), notice: 'Person was successfully created.' }
        format.json { render user_person_path(the_user, person), status: :created, location: person }
      else
        format.html { render new_user_person_path(the_user, person) }
        format.json { render json: person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if the_person.update(person_params)
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: the_person }
      else
        format.html { render edit_user_person_path(the_user, the_person) }
        format.json { render json: the_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    person = the_user.people.find(params[:id])

    person.destroy
    respond_to do |format|
      format.html { redirect_to user_people_path(the_user), notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    redirect_to user_people_path(params[:user_id]), notice: ImportPeopleFromCsvService.new(params[:user_id], params[:file]).import
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :birthday, :avatar, :notes, :company, :position, :email)
  end
end
