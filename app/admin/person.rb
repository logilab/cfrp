ActiveAdmin.register Person do
  menu parent: "Personnes", priority: 1

  scope "Tous", :all, :default => true
  scope "Acteurs", :is_actor
  scope "Auteurs", :is_author

  # filter :birthyear 
  # filter :deathyear 
  filter :plays, 
    label: 'Oeuvre',
    :as => :select,
    :collection => Play.expert_validated

  index :title => 'Personnes' do
    column "ID", :id
    column "ID Externe", :ext_id
    column "Date de Naissance", :birthyear
    column "Date de Mort", :deathyear
    column "Prenom", :first_name
    column "Nom de Famille", :last_name
    column :pref_label
    column :orig_label
    column "Pseudonyme", :pseudonym
    column "Notes BnF", :bnf_notes
    # list_column "Images" do |person|
    #   person.person_depictions.map { |depiction| image_tag(depiction.url, width: "200") }
    # end
    actions
  end

  show do |person|
    attributes_table do
      row :name
      row 'Image' do |person|
        if person.person_depictions.any?
          image_tag(person.person_depictions.first.url)
        end
      end
      row :created_at
      row :updated_at
    end
  end
  
end
