require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Expenditure, type: :model do
  DatabaseCleaner.clean
  let(:test_user) { User.create(username: 'Maria', target: 3000) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category) }
  
    # VALUE TESTING

    it "expects the subject to be invalid for it doesn't have a value" do
      subject.date = '2021/09/16'
      subject.value = nil
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it doesn't have a value" do
      subject.date = '2021/09/16'
      subject.value = 'Hola me llamo Tadeu'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end
  end
end
