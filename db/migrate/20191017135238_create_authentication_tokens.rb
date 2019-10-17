class CreateAuthenticationTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :authentication_tokens do |t|

      t.timestamps
    end
  end
end
