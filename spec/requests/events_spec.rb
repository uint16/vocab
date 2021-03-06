require 'rails_helper'

RSpec.describe "Events", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /events" do
    let (:course) { FactoryGirl.create(:course)}
    it "works! (now write some real specs)" do
      get course_events_path(course_id: course.id)
      expect(response).to have_http_status(200)
    end
  end
end
