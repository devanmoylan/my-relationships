# frozen_string_literal: true

class RemindersController < ApplicationController
  # GET /reminders
  # GET /reminders.json
  def index
    @events = the_user.events.where.not(reminder: nil).order(reminder: :desc)
  end
end
