ActiveAdmin.register Teacher do
  permit_params :email, :password, :password_confirmation, :school_id

  index do
    selectable_column
    id_column
    column :email
    column :school
    column :created_at
    actions
  end

  filter :email
  filter :school
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :school
    end
    f.actions
  end
end
