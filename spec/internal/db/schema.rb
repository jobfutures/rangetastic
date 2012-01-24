ActiveRecord::Schema.define do
  create_table :orders, :force => true do |t|
    t.datetime "ordered_on"
    t.datetime "fulfilled_on"
    t.datetime "shipped_at"
    t.timestamps
  end
end
