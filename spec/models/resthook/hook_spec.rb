require 'spec_helper'

module Resthook
  describe Hook do
    expect_it { to respond_to :subscribed_resource }
    expect_it { to respond_to :event }

    expect_it { to respond_to :url }
    expect_it { to respond_to :version }

    expect_it { to respond_to :access_token }
  end
end
