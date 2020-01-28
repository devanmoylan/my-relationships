class MentionsController < ApplicationController
  def index
    @people = Person.all

    respond_to do |format|
      format.json
    end
  end
end
