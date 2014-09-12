require 'rails_helper'

describe Picture do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :trip_id }
  it { should belong_to :user }
  it { should belong_to :trip }
end
