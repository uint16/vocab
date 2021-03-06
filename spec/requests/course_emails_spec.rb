require 'rails_helper'

RSpec.describe "CourseEmails", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /course_emails" do
    let (:course) { FactoryGirl.create(:course)}
    it "works! (now write some real specs)" do
      get course_course_emails_path(course_id: course.id)
      expect(response).to have_http_status(200)
    end
  end
end
