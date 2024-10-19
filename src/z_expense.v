module main

import time

struct Expense {
	id int @[primary; sql: serial]
	amount f32
	date string @[sql_type: 'DATE']
	description ?string
	category_id int 
	created_by ?int
	created_at time.Time @[default: 'CURRENT_TIME']
	updated_at ?string @[sql_type: 'TIMESTAMP']

}

struct ExpenseDTO {
	id int 
	amount f32
	date string 
	description ?string
	category_id int 
	category_name string 
}