package com.example.todokotlin.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.View.OnClickListener
import com.example.todokotlin.R
import com.example.todokotlin.data.TodoRepository
import com.example.todokotlin.databinding.ActivityAddTodoBinding
import com.example.todokotlin.databinding.ActivityMainBinding
import com.example.todokotlin.model.Todo

class AddTodoActivity : AppCompatActivity(), OnClickListener {
    private lateinit var binding: ActivityAddTodoBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAddTodoBinding.inflate(layoutInflater)

        setContentView(binding.root)

        setSupportActionBar(findViewById(R.id.toolbar))
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        binding.buttonConfirm.setOnClickListener(this)
    }

    override fun onClick(view: View) {
        when (view.id) {
            R.id.button_confirm -> addTodo()

        }
    }

    private fun addTodo() {
        val description = binding.editDescription.text.toString()
        val deadline = binding.editDate.text.toString()

        if (description.isNotEmpty() && deadline.isNotEmpty()) {
            TodoRepository.add(Todo(description, deadline))
            finish()
        }
    }
}