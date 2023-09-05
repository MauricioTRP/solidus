# frozen_string_literal: true

class SolidusAdmin::UI::Panel::Component < SolidusAdmin::BaseComponent
  # @param title [String] the title of the panel
  # @param title_hint [String] the title hint of the panel
  # @param actions [String] the rendered html for the actions section
  # @block content [String] the rendered html for the content section
  def initialize(title: nil, title_hint: nil, actions: nil)
    @title = title
    @title_hint = title_hint
    @actions = actions
  end
end
