module main

import time

struct Income {
	id int @[primary; sql: serial]
	expected f32
	actual ?f32
	budget_id int
	description string
	created_by ?int
	created_at time.Time @[default: 'CURRENT_TIME']
	updated_at ?string @[sql_type: 'TIMESTAMP']

}

struct IncomeDTO {
	id int 
	expected f32
	actual f32
	description string
	budget_id int
}