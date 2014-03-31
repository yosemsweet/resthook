require 'spec_helper'

module Resthook
  describe Hook do
    expect_it { to respond_to :resource_type }
    expect_it { to respond_to :actions }
    expect_it { to respond_to :match?.with(1).argument }

    expect_it { to respond_to :url }

    expect_it { to respond_to :owner }
  end
end
