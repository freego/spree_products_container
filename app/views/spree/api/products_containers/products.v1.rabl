object false
node(:count) { @products.count }
node(:total_count) { @products.total_count }
node(:current_page) { params[:page] ? params[:page].to_i : 1 }
node(:per_page) { params[:per_page] || Kaminari.config.default_per_page }
node(:pages) { @products.num_pages }
child(@products => :products) do
  object @product
  attributes *product_attributes
  child master: :master do
    extends "spree/api/variants/small"
  end
end
