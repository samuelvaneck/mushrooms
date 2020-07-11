# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MushroomsController, type: :controller do
  let(:mushroom_one) { FactoryBot.create :mushroom }
  let(:mushroom_two) { FactoryBot.create :mushroom }
  let(:mushroom_three) { FactoryBot.create :mushroom }
  let(:mushroom_four) { FactoryBot.create :mushroom }
  let(:mushroom_five) { FactoryBot.create :mushroom }

  before do
    mushroom_one
    mushroom_two
    mushroom_three
    mushroom_four
    mushroom_five
  end

  describe 'GET #index' do
    context 'with not filter' do
      before { get :index }
      it 'sets all mushrooms as @mushroom' do
        expect(assigns(:mushrooms)).to contain_exactly mushroom_one, mushroom_two, mushroom_three, mushroom_four, mushroom_five
      end

      it 'renders the index template' do
        expect(response).to render_template :index
      end
    end
  end
end
