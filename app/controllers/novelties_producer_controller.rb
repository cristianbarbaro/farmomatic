class NoveltiesProducerController < ApplicationController
  include NoveltiesProducerHelper
  
  # GET /novelties_producer
  def index
    #@novelties = current_user.novelties
    @novelties = get_novelties_user current_user

  end

  # GET /farms/1
  def show
    @novelty = Novelty.find(params[:id])
  end

  

end
