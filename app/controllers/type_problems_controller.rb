class TypeProblemsController < ApplicationController
  before_action :set_type_problem, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions_expert

  # GET /type_problems
  # GET /type_problems.json
  def index
    @type_problems = TypeProblem.all
  end

  # GET /type_problems/1
  def show
  end

  # GET /type_problems/new
  def new
    @type_problem = TypeProblem.new
  end

  # GET /type_problems/1/edit
  def edit
  end

  # POST /type_problems
  def create
    @type_problem = TypeProblem.new(type_problem_params)

    if @type_problem.save
      redirect_to @type_problem, notice: 'Type problem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /type_problems/1
  def update
    if @type_problem.update(type_problem_params)
      redirect_to @type_problem, notice: 'Type problem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /type_problems/1
  def destroy
    @type_problem.destroy
    redirect_to type_problems_url, notice: 'Type problem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_problem
      @type_problem = TypeProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_problem_params
      params.require(:type_problem).permit(:name, :scientific_name, :url, :description)
    end
end
