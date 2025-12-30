# frozen_string_literal: true

module ApplicationHelper
  def random_cta
    CALL_TO_ACTION_PHRASES.sample
  end

  def random_activity
    ACTIVITIES_LIST.sample
  end
end
