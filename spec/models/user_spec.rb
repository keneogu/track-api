require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) do
    described_class.new(
      username: 'Tadeu'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }

    it "expects the subject to be invalid for it doesn't have an username" do
      subject.username = nil
      subject.target = 0
      expect(subject).not_to be_valid
		end
	end
end
