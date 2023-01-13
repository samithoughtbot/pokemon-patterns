require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe "attributes" do
    it { should have_db_column(:name) }
    it { should have_db_column(:kind) }
    it { should have_db_column(:evolution) }
  end
end
