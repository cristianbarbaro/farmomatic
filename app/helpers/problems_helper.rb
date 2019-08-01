module ProblemsHelper
  def type_problems_for_select
    TypeProblem.all.collect { |t| [t.name, t.id] }
  end    
end
