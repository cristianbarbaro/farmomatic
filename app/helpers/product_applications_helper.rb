module ProductApplicationsHelper
  def products_for_select
    ProductApplication.all.collect { |pa| [pa.name, pa.id] }
  end
end
