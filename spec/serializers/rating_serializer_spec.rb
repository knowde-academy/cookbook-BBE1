require 'rails_helper'

describe RatingSerializer do
  subject {decribed_class.new(rating).to_h }
  
  let(:rating) { build :rating }
  
  it {is_expected.to include(rate: rating.rate)}
end