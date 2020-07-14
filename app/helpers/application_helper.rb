# frozen_string_literal: true

module ApplicationHelper
  def convert_attr_value(const_str, value)
    Mushroom.const_get(const_str)[value.to_sym]
  end

  def form_multiple_checkbox(const_str)
    const_h = Mushroom.const_get(const_str)
    attr_name = const_str.downcase
    content = ''

    const_h.map do |value, text|
      checked = params[attr_name].present? && (params[attr_name].include?(value.to_s) || value.to_s == '1')
      content += tag.input(type: :checkbox, name: attr_name + [].to_s, value: value, checked: checked) +
                 tag.label(text.humanize, for: attr_name)
    end

    sanitize content, tags: ['input', 'label'], attributes: ['type', 'name', 'value', 'for', 'checked']
  end
end
