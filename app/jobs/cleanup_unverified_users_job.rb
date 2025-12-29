# frozen_string_literal: true

# Delete users and their activities if they don't verify their email address
class CleanupUnverifiedUsersJob < ApplicationJob
  queue_as :maintenance

  def perform
    User.still_unverified_after_grace_period.find_each(&:destroy!)
  end
end
