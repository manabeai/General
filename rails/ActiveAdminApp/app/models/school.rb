class School < ApplicationRecord
  has_many :school_classes
  has_many :students, through: :school_classes
  has_many :teachers

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "id", "id_value", "name", "updated_at" ]
  end
end
