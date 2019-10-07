class ProblemsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/problems
  def index
    @problems = @plot.problems
  end

  # GET /farms/:farm_id/plots/:plot_id/problems/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/problems/new
  def new
    @problem = @plot.problems.build
  end

  # GET /farms/:farm_id/plots/:plot_id/problems/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/problems
  def create
    @problem = @plot.problems.build(problem_params)

    if @problem.save
      redirect_to farm_plot_problems_path(@farm, @plot), notice: 'Problem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/problems/:id
  def update
    if @problem.update(problem_params)
      redirect_to farm_plot_problem_path(@farm, @plot), notice: 'Problem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/problems/:id
  def destroy
    @problem.destroy
    redirect_to farm_plot_problems_path, notice: 'Problem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = @plot.problems.find(params[:id])
    end

    def set_farm
      @farm = Farm.find(params[:farm_id])
    end

    def set_plot
      @plot = @farm.plots.find(params[:plot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:comment, :type_problem_id)
    end
end
