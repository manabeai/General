ActiveAdmin.register SchoolClass do
  permit_params :name, :school_id

  controller do
    def scoped_collection
      if current_admin_user
        super
      else
        super.where(school_id: current_teacher.school_id)
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :school
    column :created_at
    actions
  end

  filter :name
  filter :school
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :school
    end
    f.actions
  end
end
