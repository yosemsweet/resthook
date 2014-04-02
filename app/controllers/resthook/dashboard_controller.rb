module Resthook
  # The dashboard will provide access to an overview of all the hooks
  # set up in the system, as well as the resources available for hooking into.
  class DashboardController < ApplicationController
    respond_to :html

    # Display the dashboard
    # No special parameters required.
    def show
      @hooks = Hook.all
    end
  end
end
