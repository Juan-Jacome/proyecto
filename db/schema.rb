# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_28_203802) do

  create_table "coctels", force: :cascade do |t|
    t.string "nombre_coctel"
    t.decimal "gramos_alcohol"
    t.decimal "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "formularios", force: :cascade do |t|
    t.string "nombre_drinker"
    t.decimal "estatura_cm"
    t.decimal "peso_kg"
    t.string "genero"
    t.integer "horas_estadia"
    t.string "perfil"
    t.decimal "presupuesto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "userlog_id"
    t.index ["userlog_id"], name: "index_formularios_on_userlog_id"
  end

  create_table "liquor_coctels", force: :cascade do |t|
    t.integer "coctel_id", null: false
    t.integer "liquor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coctel_id"], name: "index_liquor_coctels_on_coctel_id"
    t.index ["liquor_id"], name: "index_liquor_coctels_on_liquor_id"
  end

  create_table "liquor_formularios", force: :cascade do |t|
    t.integer "liquor_id", null: false
    t.integer "formulario_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["formulario_id"], name: "index_liquor_formularios_on_formulario_id"
    t.index ["liquor_id"], name: "index_liquor_formularios_on_liquor_id"
  end

  create_table "liquors", force: :cascade do |t|
    t.string "nombre_licor"
    t.string "marca"
    t.decimal "grados_alcohol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "userlogs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_userlogs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_userlogs_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "id_usuario"
    t.string "nombre"
    t.string "apellido"
    t.string "correo"
    t.string "telefono"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "liquor_coctels", "coctels"
  add_foreign_key "liquor_coctels", "liquors"
  add_foreign_key "liquor_formularios", "formularios"
  add_foreign_key "liquor_formularios", "liquors"
end
