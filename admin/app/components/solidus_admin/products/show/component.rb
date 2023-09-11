# frozen_string_literal: true

class SolidusAdmin::Products::Show::Component < SolidusAdmin::BaseComponent
  def initialize(product:)
    @product = product
  end

  def form_id
    @form_id ||= "#{stimulus_id}--form-#{@product.id}"
  end
end
