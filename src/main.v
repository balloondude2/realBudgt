
// You can also enable vebs livereload feature with
// `v watch -d veb_livereload run main.v`
module main

import veb
import db.sqlite
import os
import time

struct Todo {
pub mut:
	// `id` is the primary field. The attribute `sql: serial` acts like AUTO INCREMENT in sql.
	// You can use this attribute if you want a unique id for each row.
	id        int @[primary; sql: serial]
	name      string
	completed bool
	created   time.Time
	updated   time.Time
}

pub struct Context {
	veb.Context
pub mut:
	created_todo bool
}

pub struct App {
	veb.StaticHandler
pub:
	// we can access the SQLITE database directly via `app.db`
	db sqlite.DB
}

// This method will only handle GET requests to the index page
@[get]
pub fn (app &App) index(mut ctx Context) veb.Result {
	// ctx.form_error = 'Test error'
	return $veb.html()
}

fn main() {
	os.chdir(os.dir(@FILE))!
	// create a new App instance with a connection to the database
	mut app := &App{
		db: sqlite.connect('budgt.db')!
	}

	// mount the assets folder at `/assets/`
	app.handle_static('assets', false)!

	sql app.db {
		create table Expense
	} or { panic('error on create table: ${err}')}
	
	sql app.db {
		create table Income
	} or { panic('error on create table: ${err}')}

	// sql app.db {
	// 	create table Category
	// } or { panic('error on create table: ${err}')}

	sql app.db {
		create table Budget
	} or { panic('error on create table: ${err}')}

	sql app.db {
		create table Budget_Categories
	} or { panic('error on create table: ${err}')}

	// sql app.db {
	// 	create table Event
	// } or { panic('error on create table: ${err}')}

	// sql app.db {
	// 	create table Setup_Income
	// } or { panic('error on create table: ${err}')}

	// sql app.db {
	// 	create table Savings
	// } or { panic('error on create table: ${err}')}

	// start our app at port 8080
	veb.run[App, Context](mut app, 8080)
}