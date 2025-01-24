ActiveAdmin.register Student do
  permit_params :name, :school_class_id

  controller do
    def scoped_collection
      if current_admin_user
        super
      else
        super.joins(:school_class).where(school_classes: { school_id: current_teacher.school_id })
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :school_class
    column :created_at
    actions
  end

  filter :name
  filter :school_class, as: :select, collection: SchoolClass.all.map { |sc| [ sc.name, sc.id ] }
  filter :school, as: :select, collection: School.all.map { |s| [ s.name, s.id ] }
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :school, as: :select, collection: School.all.map { |s| [ s.name, s.id ] }, input_html: { data: { action: "change->school-class#updateSchoolClasses", school_class_target: "schoolSelect" } }
      f.input :school_class, as: :select, collection: [], input_html: { data: { school_class_target: "schoolClassSelect" } }
    end
    f.actions
  end
end
