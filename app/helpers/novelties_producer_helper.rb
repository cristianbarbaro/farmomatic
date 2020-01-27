module NoveltiesProducerHelper
    def get_novelties_user(user)
        novelties = Array.new
        Novelty.all.each do |n|
            if not n.variety.nil?
                if  user.varieties.exists? n.variety.id
                    novelties << n
                end
            end
            if not n.type_problem.nil?
                if  user.type_problems.exists? n.type_problem.id
                    novelties << n
                end
            end
            if not n.product.nil?
                if  user.products.exists? n.product.id
                    novelties << n
                end
            end   
        end
        novelties.uniq
    end
end
