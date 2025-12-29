# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CleanupUnverifiedUsersJob, type: :job do
  subject(:cleanup_unverified_users) { described_class.perform_now }

  describe '#perform' do
    let!(:stale_user) do
      create(
        :user,
        verified_at: nil,
        verification_sent_at: 8.days.ago,
        created_at: 8.days.ago
      )
    end

    let!(:fresh_unverified_user) do
      create(
        :user,
        verified_at: nil,
        verification_sent_at: 1.hour.ago,
        created_at: 1.hour.ago
      )
    end

    let!(:unverified_user) do
      create(
        :user,
        verified_at: nil,
        verification_sent_at: 2.days.ago,
        created_at: 2.days.ago
      )
    end

    let!(:verified_user) do
      create(
        :user,
        :verified,
        verification_sent_at: 8.days.ago,
        created_at: 8.days.ago
      )
    end

    before do
      cleanup_unverified_users
    end

    it 'destroys users who have not verified within the allowed time' do
      expect(User.exists?(stale_user.id)).to be(false)
    end

    it 'does not destroy fresh unverified users' do
      expect(User.exists?(fresh_unverified_user.id)).to be(true)
    end

    it 'does not destroy unverified users' do
      expect(User.exists?(unverified_user.id)).to be(true)
    end

    it 'does not destroy verified users' do
      expect(User.exists?(verified_user.id)).to be(true)
    end
  end
end
