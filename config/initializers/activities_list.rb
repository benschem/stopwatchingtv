# frozen_string_literal: true

ACTIVITIES_LIST = Rails.application
                       .config_for(:activities_list)
                       .fetch(:activities)
                       .freeze
