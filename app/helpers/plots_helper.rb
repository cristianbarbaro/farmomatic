module PlotsHelper
    def farms_for_select
        Farm.all.collect { |f| [f.name, f.id] }
    end
end
