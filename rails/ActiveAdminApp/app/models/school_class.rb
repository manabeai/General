class SchoolClass < ApplicationRecord
  belongs_to :school

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "name", "school_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "school" ]
  end
end
