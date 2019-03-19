package com.example.flutterapp

fun main(args: Array<String>) {
    println("我在kotlin中运行main函数")
    Greeter("kotlin", 100).greet(90)
    println(MyBean("张三", "23", "男").toString())
}
class Greeter(var name: String, var num: Int){
    fun greet(num1: Int){
        println("hello $name")
        when(num > num1){
            true -> println("$num 大于 $num1")
            false -> println("$num 小于等于 $num1")
        }
    }
}