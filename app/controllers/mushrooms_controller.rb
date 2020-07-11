# frozen_string_literal: true

class MushroomsController < ApplicationController
  def index
    @mushrooms = Mushroom.all
  end
end
