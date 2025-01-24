class Student < ApplicationRecord
  belongs_to :school_class
  has_one :school, through: :school_class

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "name", "school_class_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "school_class", "school" ]
  end
end
