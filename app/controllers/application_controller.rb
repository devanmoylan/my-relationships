# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def the_user
    @user ||= User.find(params[:user_id] || params[:id])
  end

  def the_person
    @person ||= the_user.people.find(params[:person_id] || params[:id])
  end
end
