# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def go
    restaurant = Restaurant.all
    @recommend = restaurant.sample
  end
end
