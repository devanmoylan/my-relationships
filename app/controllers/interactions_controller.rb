# frozen_string_literal: true

class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[edit update destroy]

  # GET /interactions/new
  def new
    @interaction = the_person.interactions.build(user: the_user)
  end

  # GET /interactions/1/edit
  def edit; end

  # POST /interactions
  # POST /interactions.json
  def create
    @interaction = the_person.interactions.build(interaction_params.merge(user: the_user))

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interaction was successfully created.' }
        format.json { render user_person_path(the_user, the_person), status: :created, location: @interaction }
      else
        format.html { render new_user_person_interaction_path(the_user, the_person) }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interactions/1
  # PATCH/PUT /interactions/1.json
  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interaction was successfully updated.' }
        format.json { render user_person_path(the_user, the_person), status: :ok, location: @interaction }
      else
        format.html { render edit_user_person_interaction_path(the_user, the_person, @interaction) }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.json
  def destroy
    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to user_person_path(the_user, the_person), notice: 'Interaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interaction
    @interaction = the_person.interactions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interaction_params
    params.require(:interaction).permit(:notes, :key_take_aways, :follow_ups, :location, :private_interaction)
  end
end
