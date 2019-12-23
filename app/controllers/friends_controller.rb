# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :set_user, only: %i[show new create edit update destroy index]
  before_action :set_friend, only: %i[show edit update destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = @user.friends
  end

  # GET /friends/1
  # GET /friends/1.json
  def show; end

  # GET /friends/new
  def new
    @friend = @user.friends.build
  end

  # GET /friends/1/edit
  def edit; end

  # POST /friends
  # POST /friends.json
  def create
    @friend = @user.friends.create!(friend_params)

    respond_to do |format|
      if @friend.persisted?
        format.html { redirect_to user_friends_path(@user), notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render new_user_friend_path(@user) }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to user_friend_path(@user, @friend), notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render edit_user_friend_path(@user, @friend) }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to user_friends_path(@user), notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = @user.friends.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friend_params
    params.require(:friend).permit(:first_name, :last_name)
  end
end
