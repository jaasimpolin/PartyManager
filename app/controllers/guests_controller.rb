class GuestsController < ApplicationController

before_filter :authenticate

  def new
@guest = Guest.new
  end

  def show
@guest = Guest.find(params[:id])
  end

  def edit
@guest = Guest.find(params[:id])
  end

  def index

  end

  def create
    params[:guest][:host_id] = current_host.id
    @guest = Guest.new(params[:guest])

      if @guest.save
          flash[:success] = "Guest created!"
      redirect_to @guest
      else
        render :action => "new" 
      end
    
   end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_url, :notice => "Successfully destroyed guest."
  end

end
