require 'spec_helper'

describe Category do
  it { should have_and_belong_to_many :recipes   }
  it { should validate_uniqueness_of  :dish_type }
end
