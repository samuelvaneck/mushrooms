# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#convert_attr_value' do
    it 'returns the value by looking it up in model constant' do
      expect(helper.convert_attr_value('CAP_COLOR', 'n')).to eq 'brown'
    end
  end
end
