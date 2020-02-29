# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update destroy]

  # GET /events/new
  def new
    @event = the_user.events.build
  end

  def index
    @events = the_user.events.includes([:rich_text_notes]).order(created_at: :desc)
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = the_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to user_path(the_user), notice: 'Event was successfully created.' }
        format.json { render user_path(the_user), status: :created, location: @event }
      else
        format.html { render new_user_event_path(the_user) }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_path(the_user), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render edit_user_event_path(the_user, @event) }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_path(the_user), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event ||= the_user.events.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:notes, :reminder_datetime, :reminder_note, :title, :location)
  end
end
