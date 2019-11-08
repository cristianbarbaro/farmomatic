class NoveltiesController < ApplicationController
  before_action :set_novelty, only: [:show, :edit, :update, :destroy]

  # GET /novelties
  def index
    @novelties = current_user.novelties
  end

  # GET /novelties/1
  def show
  end

  # GET /novelties/new
  def new
    @novelty = Novelty.new
  end

  # GET /novelties/1/edit
  def edit
  end

  # POST /novelties
  def create
    @novelty = Novelty.new(novelty_params)
    @novelty.user = current_user

    if @novelty.save
      redirect_to @novelty, notice: 'Novelty was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /novelties/1
  def update
    if @novelty.update(novelty_params)
      redirect_to @novelty, notice: 'Novelty was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /novelties/1
  def destroy
    @novelty.destroy
    redirect_to novelties_url, notice: 'Novelty was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_author_novelty(novelty)
      current_user.eql? novelty.user
    end
    
    def set_novelty
      @novelty = Novelty.find(params[:id])
      if not check_author_novelty @novelty
        head 403
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novelty_params
      params.require(:novelty).permit(:title, :body)
    end
end
