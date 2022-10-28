package com.example.todokotlin.data

import com.example.todokotlin.model.Todo

class TodoRepository private constructor(){
    companion object {
        val items = mutableListOf<Todo>()

        fun add(todo: Todo){
            items.add(todo)
        }
    }
}