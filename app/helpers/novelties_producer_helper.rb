module NoveltiesProducerHelper
    def get_novelties_user(user)
        novelties = Array.new
        Novelty.all.each do |n|
            if not n.variety.nil?
                if  user.varieties.exists? n.variety.id
                    novelties << n
                end
            end
            if not n.product.nil?
                if  user.products.exists? n.variety.id
                    novelties << n
                end
            end
            if not n.product.nil?
                if  user.products.exists? n.variety.id
                    novelties << n
                end
            end   
        end
        novelties
    end
end
