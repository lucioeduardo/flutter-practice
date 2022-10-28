package com.example.todokotlin.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.ArrayAdapter
import com.example.todokotlin.R
import com.example.todokotlin.config.Constants
import com.example.todokotlin.data.MethodChannelHelper
import com.example.todokotlin.data.TodoRepository
import com.example.todokotlin.databinding.ActivityMainBinding
import com.example.todokotlin.model.Todo
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var adapter: ArrayAdapter<Todo>
    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createFlutterEngine()

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

    override fun onOptionsItemSelected(item: MenuItem) = when (item.itemId) {
        R.id.add -> {
            goToAddTodo()
            true
        }
        else -> super.onOptionsItemSelected(item)
    }

    private fun createFlutterEngine() {
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        FlutterEngineCache
            .getInstance()
            .put(Constants.Flutter.DEFAULT_ENGINE, flutterEngine)
    }


    private fun createList() {
        adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, TodoRepository.items)

        binding.todoList.adapter = adapter

        binding.todoList.setOnItemClickListener { _, _, position, _ ->
            openTodoDetail(position)
        };
    }

    private fun openTodoDetail(index: Int) {
        val todo = TodoRepository.items[index]

        MethodChannelHelper(flutterEngine.dartExecutor.binaryMessenger).setTodo(todo)

        startActivity(
            FlutterActivity
                .withCachedEngine(Constants.Flutter.DEFAULT_ENGINE)
                .build(this)
        );
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