require 'rails_helper'

RSpec.describe "word_forms/new", type: :view do
  before(:each) do
    assign(:word_form, WordForm.new(
      :associated_word => "MyString",
    ))
    @words = Word.all
  end

  it "renders new word_form form" do
    render

    assert_select "form[action=?][method=?]", word_forms_path, "post" do

      assert_select "input#word_form_associated_word[name=?]", "word_form[associated_word]"

    end
  end
end
