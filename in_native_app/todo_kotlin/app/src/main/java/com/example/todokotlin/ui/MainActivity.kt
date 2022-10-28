package com.example.todokotlin.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.ArrayAdapter
import com.example.todokotlin.R
import com.example.todokotlin.data.TodoRepository
import com.example.todokotlin.databinding.ActivityMainBinding
import com.example.todokotlin.model.Todo

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    private lateinit var adapter: ArrayAdapter<Todo>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(findViewById(R.id.toolbar))
        supportActionBar?.setDisplayHomeAsUpEnabled(false)

        createList()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem)
        = when(item.itemId){
            R.id.add -> {
                goToAddTodo()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }


    private fun createList(){
        adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, TodoRepository.items)

        binding.todoList.adapter = adapter

        binding.todoList.setOnItemClickListener{ _, _, position, _ ->
            onClickTodo(position)
        };
    }

    private fun onClickTodo(index: Int){
        Log.d("Lista", "$index: ${TodoRepository.items[index]}")
    }

    private fun goToAddTodo() {
        val intent = Intent(this, AddTodoActivity::class.java)
        startActivity(intent)
    }

    override fun onResume() {
        super.onResume()
        adapter.notifyDataSetChanged()
    }
}