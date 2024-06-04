class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to place_path(@entry.place), notice: 'Entry created successfully.'
    else
      render :new
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end
