package com.example.todokotlin.data

import com.example.todokotlin.config.Constants
import com.example.todokotlin.model.Todo
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class MethodChannelHelper(val binaryMessenger: BinaryMessenger) {

    private val channel = MethodChannel(binaryMessenger, Constants.Flutter.TEST_CHANNEL)

    fun setTodo(todo: Todo) {
        channel.invokeMethod(
            Constants.Flutter.SET_TODO_METHOD,
            mapOf("description" to todo.description, "deadline" to todo.date)
        )
    }
}