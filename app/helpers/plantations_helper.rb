module PlantationsHelper
  def species_for_select
    Species.all.collect { |s| [s.name, s.id] }
  end
end
