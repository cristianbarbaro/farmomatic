class NoveltiesProducerController < ApplicationController
  
  # GET /novelties_producer
  def index
    @novelties = current_user.novelties
  end

  # GET /farms/1
  def show
    @novelty = Novelty.find(params[:id])
  end

  

end
