require "spec_helper"

module Resthook
  describe HooksController do
    routes { Resthook::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(get("/hooks")).to route_to("resthook/hooks#index")
      end

      it "routes to #new" do
        expect(get("/hooks/new")).to route_to("resthook/hooks#new")
      end

      it "routes to #show" do
        expect(get("/hooks/1")).to route_to("resthook/hooks#show", :id => "1")
      end

      it "routes to #edit" do
        expect(get("/hooks/1/edit")).to route_to("resthook/hooks#edit", :id => "1")
      end

      it "routes to #create" do
        expect(post("/hooks")).to route_to("resthook/hooks#create")
      end

      it "routes to #update" do
        expect(put("/hooks/1")).to route_to("resthook/hooks#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(delete("/hooks/1")).to route_to("resthook/hooks#destroy", :id => "1")
      end

    end
  end
end
