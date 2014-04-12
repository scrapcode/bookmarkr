class MarksController < ApplicationController
  before_action :signed_in_user,   only: [:create, :destroy, :update]
  before_action :correct_user,     only: [:update, :destroy]

  def new
    @mark = current_user.marks.build(mark_params)
  end
  
  # POST /marks
  # POST /marks.json
  def create
    @mark = current_user.marks.build(mark_params)

    respond_to do |format|
      if @mark.save
        format.html { redirect_to current_user, flash[:notice] => 'Mark was successfully created.' }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params).
        format.html { redirect_to current_user, flash[:notice] => 'Mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  private

    def mark_params
      params.require(:mark).permit(:title, :url, :tag_list)
    end
  
    def correct_user
      @mark = current_user.marks.find_by(id: params[:id])
      redirect_to root_url if @mark.nil?
    end
end
