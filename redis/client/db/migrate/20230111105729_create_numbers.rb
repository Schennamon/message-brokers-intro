class CreateNumbers < ActiveRecord::Migration[6.1]

  def change
    create_table :numbers do |t|
      t.bigint :value
    end
  end
  
end
