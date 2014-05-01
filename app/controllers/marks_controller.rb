class MarksController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,     only: [:edit, :update, :destroy]

  def new
    unless params[:title] and params[:url]
      @mark = current_user.marks.new
    else
      @mark = current_user.marks.build(mark_params_remote)
      @remote_addition = true
    end
  end
  
  # POST /marks
  def create
    @mark = current_user.marks.build(mark_params)

    if @mark.save
      if params[:remote]
        render 'close'
      else
        redirect_to root_path, notice: "Mark was successfully created."
      end
    else
      render :new 
    end
  end
  
  def edit
    @mark = current_user.marks.find_by(id: params[:id])
  end

  # PATCH/PUT /marks/1
  def update
    if @mark.update(mark_params)
      redirect_to root_path, notice: 'Mark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /marks/1
  def destroy
    @mark.destroy
    redirect_to root_path, notice: "Mark was deleted." 
  end

  private

    def mark_params
      params.require(:mark).permit(:title, :url, :tag_list)
    end
    
  def mark_params_remote
    params.permit(:title, :url)
    end
  
    def correct_user
      @mark = current_user.marks.find_by(id: params[:id])
      redirect_to root_url if @mark.nil?
    end
end
