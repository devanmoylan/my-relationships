# frozen_string_literal: true

class MentionsController < ApplicationController
  def index
    @people = current_user.people

    respond_to do |format|
      format.json
    end
  end
end
