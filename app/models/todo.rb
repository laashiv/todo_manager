class Todo < ActiveRecord::Base

  belongs_to :user
  # table called "users"
  # todos table will contain "user_id"

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  
