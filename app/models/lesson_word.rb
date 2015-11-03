class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  has_many :lesson_word_definitions
  has_many :definitions, through: :lesson_word_definitions

  has_many :lesson_word_videos
  has_many :word_videos, through: :lesson_word_videos

  has_many :lesson_word_sentences
  has_many :sentences, through: :lesson_word_sentences

  accepts_nested_attributes_for :lesson_word_definitions
  accepts_nested_attributes_for :lesson_word_videos
  accepts_nested_attributes_for :lesson_word_sentences
end
