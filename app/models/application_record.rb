# frozen_string_literal: true
# rubocop:disable all

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
