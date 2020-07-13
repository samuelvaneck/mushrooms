# frozen_string_literal: true

module ApplicationHelper
  def convert_attr_value(const_str, value)
    Mushroom.const_get(const_str)[value.to_sym]
  end

  def form_multiple_checkbox(const_str)
    const_h = Mushroom.const_get(const_str)
    content = ''

    content += tag.label const_str.humanize
    const_h.map do |value, text|
      content += tag.input(type: :checkbox, name: const_str.downcase+[].to_s, value: value) +
                 tag.label(text.humanize, for: const_str.downcase)
    end

    sanitize content, tags: ['input', 'label'], attributes: ['type', 'name', 'value', 'for']
  end
end
