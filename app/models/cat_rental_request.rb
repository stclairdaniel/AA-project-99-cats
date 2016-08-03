class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :overlapping_approved_requests

  belongs_to :cat

  def in_date_range?(request_start_date, request_end_date)
    start_in_range = start_date > request_start_date && start_date < request_end_date
    end_in_range = end_date > request_start_date && end_date < request_end_date
    start_in_range || end_in_range
  end

  def overlapping_requests
    CatRentalRequest.all.select do |request|
      in_date_range?(request.start_date, request.end_date) &&
      cat_id == request.cat_id
    end
  end

  def overlapping_approved_requests
    bad_requests = overlapping_requests.any? do |request|
      request.status == 'APPROVED'
    end
    if bad_requests
      self.errors[:request] << "Can't overlap another request"
    end
  end

  def approve!
    self.transaction do
      self.status = "APPROVED"
      self.save!
      self.overlapping_requests.each do |request|
        request.status = "DENIED"
      end
    end
  end

  def deny!
    self.transaction do
      self.status = "DENIED"
      self.save!
    end
  end

  def pending?
    self.status == 'PENDING'
  end

end
