class NoveltiesProducerController < ApplicationController
  
  def index
    @novelties = current_user.novelties
  end
end
