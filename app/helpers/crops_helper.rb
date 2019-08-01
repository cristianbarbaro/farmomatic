module CropsHelper
  def varieties_for_select
    Variety.all.collect { |v| [v.name, v.id] }
  end
end
