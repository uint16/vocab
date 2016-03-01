
require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CourseEmailsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # CourseEmail. As you add validations to CourseEmail, be sure to
  # adjust the attributes here as well.
  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) {
    {
        title: 'Hello Class',
        content: 'I just wanted to welcome you to class',
        course_id: course.id,
        user_id: [3,""]
    }
  }

  let(:invalid_attributes) {
    {
        title: 'Hi',
        content: 'there'
    }
  }

  before(:each) do
    user.add_role(:teacher, course)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CourseEmailsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all course_emails as @course_emails" do
      course_email = CourseEmail.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:course_emails)).to eq([course_email])
    end
  end

  describe "GET #show" do
    it "assigns the requested course_email as @course_email" do
      course_email = CourseEmail.create! valid_attributes
      get :show, {:id => course_email.to_param}, valid_session
      expect(assigns(:course_email)).to eq(course_email)
    end
  end

  describe "GET #new" do
    it "assigns a new course_email as @course_email" do
      get :new, {}, valid_session
      expect(assigns(:course_email)).to be_a_new(CourseEmail)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "should deliver the new course email" do
        expect {
          post :create, {:course_email => valid_attributes,
                         title: 'Hello Class',
                         content: 'I just wanted to welcome you to class',
                         course_id: course.id,
                         user_id: [3,""]
                      }, valid_session
        }.to change(CourseEmail, :count).by(1)
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course_email as @course_email" do
        post :create, {:course_email => invalid_attributes}, valid_session
        expect(assigns(:course_email)).to be_a_new(CourseEmail)
      end

      it "re-renders the 'new' template" do
        post :create, {:course_email => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
            title: 'Hi Class'
        }
      }

      it "updates the requested course_email" do
        course_email = CourseEmail.create! valid_attributes
        put :update, {:id => course_email.to_param, :course_email => new_attributes}, valid_session
        course_email.reload
        expect(assigns(:course_email).attributes.symbolize_keys[:title]).to eq(new_attributes[:title])
      end

      it "assigns the requested course_email as @course_email" do
        course_email = CourseEmail.create! valid_attributes
        put :update, {:id => course_email.to_param, :course_email => valid_attributes}, valid_session
        expect(assigns(:course_email)).to eq(course_email)
      end

      it "redirects to the course_email" do
        course_email = CourseEmail.create! valid_attributes
        put :update, {:id => course_email.to_param, :course_email => valid_attributes}, valid_session
        expect(response).to redirect_to(course_email)
      end
    end

    context "with invalid params" do
      it "assigns the course_email as @course_email" do
        course_email = CourseEmail.create! valid_attributes
        put :update, {:id => course_email.to_param, :course_email => invalid_attributes}, valid_session
        expect(assigns(:course_email)).to eq(course_email)
      end
    end
  end


end
