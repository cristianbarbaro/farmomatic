module ApplicationHelper
  def plots_for_select
    Plot.all.collect { |i| [i.identifier, i.id] }
  end

  def user_is_owner?(farm)
    current_user.has_role? :owner, farm
  end
end
