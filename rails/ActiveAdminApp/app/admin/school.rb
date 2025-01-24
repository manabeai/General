ActiveAdmin.register School do
  permit_params :name

  controller do
    def scoped_collection
      if current_admin_user
        super
      else
        super.where(id: current_teacher.school_id)
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  filter :school_classes, if: proc { params[:q] && params[:q][:id_eq].present? } do
    SchoolClass.where(school_id: params[:q][:id_eq])
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
