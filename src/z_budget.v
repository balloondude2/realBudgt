module main

import time
//import db.sqlite

struct Budget {
	id int @[primary; sql: serial]
	group_id int
	time_period string //YYYY-MM 
	status string
	created_by ?int
	created_at time.Time @[default: 'CURRENT_TIME']
	updated_at ?string @[sql_type: 'TIMESTAMP']
}

enum Budget_Status {
	draft
	ready
	reconcile
}

struct Budget_Categories {
	id int @[primary; sql: serial]
	budget_id int  @[fkey]
	category_id int @[fkey]
	//expected f32
	planned ?f32
	sort_order int @[default: 0]
}

struct BudcatDTO {
	id int
	category string
	planned f32
	amount f32
}

struct NewBudcatDTO {
	id int
	budget_id int
	category_id int
	planned f32
	amount f32
}