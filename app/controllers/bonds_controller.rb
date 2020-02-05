# frozen_string_literal: true

class BondsController < ApplicationController
  def new
    @bond = the_person.bonds.build
  end

  # GET /bonds/1/edit
  def edit
    @bond = the_person.bonds.find_by(id: params[:id])
  end

  # POST /bonds
  # POST /bonds.json
  def create
    @bond = the_person.bonds.build(bond_params)

    respond_to do |format|
      if @bond.save
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Bond was successfully created.' }
        format.json { render :show, status: :created, location: user_person_path(the_user, the_person) }
      else
        format.html { render new_user_person_bond_path(the_user, the_person) }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonds/1
  # PATCH/PUT /bonds/1.json
  def update
    bond = the_person.bonds.find_by(id: params[:id])
    respond_to do |format|
      if bond.update(bond_params)
        format.html { redirect_to user_person_path(the_user, the_person), notice: 'Bond was successfully updated.' }
        format.json { render :show, status: :ok, location: user_person_path(the_user, the_person) }
      else
        format.html { render edit_user_person_bond_path(the_user, the_person) }
        format.json { render json: bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonds/1
  # DELETE /bonds/1.json
  def destroy
    the_person.bonds.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to user_person_path(the_user, the_person), notice: 'Bond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def bond_params
    params.require(:bond).permit(:first_name, :last_name, :relationship, :birthday)
  end
end
