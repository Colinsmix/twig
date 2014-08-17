class Project < ActiveRecord::Base
  include AASM

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :short_description
  validates_presence_of :organizer

  belongs_to :organizer, :class_name => "User"

  has_many :comments,
  inverse_of: :project

  def status_formatted
    case status
    when 'pending_approval'
      "Pending Approval"
    when 'approved'
      "Approved"
    when 'looking_for_contributors'
      "Looking For Contributors"
    when 'in_progress'
      "In Progress"
    when 'completed'
      "Completed"
    when 'cancelled'
      "Cancelled"
    end
  end

  # AASM
  aasm :column => 'status' do
    state :pending_approval, :initial => true
    state :approved
    state :looking_for_contributors
    state :in_progress
    state :completed
    state :cancelled

    event :approve do
      transitions :from => :pending_approval, :to => :approved
    end

    event :find_contributors do
      transitions :from => :approved, :to => :looking_for_contributors
    end

    event :start_progress do
      transitions :from => [:approved, :looking_for_contributors], :to => :in_progress
    end

    event :complete do
      transitions :from => [:approved, :looking_for_contributors, :in_progress], :to => :completed
    end

    event :cancel do
      transitions :from => [:pending_approval, :approved, :looking_for_contributors, :in_progress], :to => :cancelled
    end
  end
end
