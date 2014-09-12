require 'rails_helper'

describe Trip do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :description }
end
