# frozen_string_literal: true

module ApplicationHelper
  def convert_attr_value(attr, value)
    const_arr = Mushroom.const_get(attr.upcase)
    const_arr.each do |arr|
      return arr[0] if arr[1] == value
    end
  end
end
