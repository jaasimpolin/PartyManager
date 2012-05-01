class PartiesController < ApplicationController

before_filter :authenticate, :only => [:create, :destroy]
  def index
    
    @parties = current_host.parties.all
    
  end

  def create
    @party = current_host.parties.build(params[:party])
    if @party.save
      flash[:success] = "Party created!"
      redirect_to root_path
    else
       render :action => 'new'
    end
   
  end

  def destroy
      Party.find(params[:id]).destroy
    flash[:success] = "Host destroyed"
    redirect_to current_host   
  end

  def new
 @party = Party.new
  end

  def edit
 @party = Party.find(params[:id])
  end

  def show
 @party = Party.find(params[:id])
    @current_guests = @party.guests.all
  end

end
