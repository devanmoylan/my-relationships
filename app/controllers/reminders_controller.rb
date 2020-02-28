# frozen_string_literal: true

class RemindersController < ApplicationController
  # GET /reminders
  # GET /reminders.json
  def index
    @events = the_user.events.where.not(reminder_datetime: nil).order(reminder_datetime: :desc)
  end
end
