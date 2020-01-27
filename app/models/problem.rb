class Problem < ApplicationRecord
  belongs_to :type_problem
  belongs_to :plot
  belongs_to :user

  validates :plot_id, :type_problem_id, presence: true
end
