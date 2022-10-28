package com.example.todokotlin.model

data class Todo(val description: String, val date: String) {
    override fun toString(): String {
        return description
    }
}