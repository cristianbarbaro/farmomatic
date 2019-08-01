module ApplicationHelper
  def plots_for_select
    Plot.all.collect { |i| [i.identifier, i.id] }
  end
end
