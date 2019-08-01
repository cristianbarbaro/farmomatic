module ProductApplicationsHelper
  def products_for_select
    Product.all.collect { |pa| [pa.name, pa.id] }
  end
end
