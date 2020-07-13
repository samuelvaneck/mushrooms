# frozen_string_literal: true

class MushroomsController < ApplicationController
  def index
    @mushrooms = Mushroom.filter_by(params)
  end
end
