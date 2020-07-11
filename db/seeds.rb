# frozen_string_literal: true

counter = Mushroom.import(Rails.root.join('db/data/agaricus-lepiota.data'))
print "Imported #{counter} mushrooms"
