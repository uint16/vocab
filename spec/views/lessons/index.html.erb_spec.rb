require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  let (:course) { FactoryGirl.create(:course)}
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: course,
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      ),
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: course,
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      )
    ])
    @course = course
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Lesson Name".to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    #TODO need to add more tests for the other params
  end
end
