module NoveltiesHelper
    def products_for_select
        Product.all.collect { |p| [p.name, p.id] }
    end

    def varieties_for_select
        Variety.all.collect { |v| [v.name, v.id] }
    end

    def types_problems_for_select
        TypeProblem.all.collect { |t| [t.name, t.id] }
    end
end
