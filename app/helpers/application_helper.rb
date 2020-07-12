# frozen_string_literal: true

module ApplicationHelper
  def convert_attr_value(const_str, value)
    Mushroom.const_get(const_str)[value.to_sym]
  end
end
