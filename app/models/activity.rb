# frozen_string_literal: true

# An Activity that a user could do instead of watching TV
class Activity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
