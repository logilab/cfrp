ActiveAdmin.register RegisterPeriodSeatingCategory do
  menu false
  index do
    selectable_column
    column :id
    column :register_period_id
    column :seating_category_id
    column :ordering
    default_actions
  end
end