# frozen_string_literal: true

CALL_TO_ACTION_PHRASES = Rails.application
                              .config_for(:call_to_action_phrases)
                              .fetch(:phrases)
                              .freeze
