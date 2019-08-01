module ApplicationHelper
  def plots_for_select
    Plot.all.collect { |i| [i.name, i.id] }
  end
end
