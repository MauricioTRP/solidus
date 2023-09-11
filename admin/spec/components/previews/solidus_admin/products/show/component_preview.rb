# frozen_string_literal: true

# @component "products/show"
class SolidusAdmin::Products::Show::ComponentPreview < ViewComponent::Preview
  include SolidusAdmin::Preview

  def overview
    render_with_template
  end

  # @param product text
  def playground(product: "product")
    render component("products/show").new(product: product)
  end
end
