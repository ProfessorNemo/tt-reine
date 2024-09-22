# Тестовое задание от Reine

## Установка:

```
git clone https://github.com/ProfessorNemo/tt-reine.git
```

[Текст заданий](https://github.com/ProfessorNemo/tt-reine/blob/master/test_task.pdf)

## Решение:

- [Задача#1](https://github.com/ProfessorNemo/tt-reine/tree/master/task_1)

  ###### Запуск:
  
  ```
  cd task_1/lib/
  ruby start.rb
  ```
  ###### Пример выполнения (вывод в консоль):
  
  ```
  transactions:
  
  2023-09-03T12:45:00Z,txn12345,user987,500.25
  2023-09-03T12:46:00Z,txn6345,user111,900.25
  2023-09-03T12:47:00Z,txn67890,user123,300.50
  2023-09-03T12:48:00Z,txn11111,user456,400.75
  	
  sorted_transactions:
  
  2023-09-03T12:46:00Z,txn6345,user111,900.25
  2023-09-03T12:45:00Z,txn12345,user987,500.25
  2023-09-03T12:48:00Z,txn11111,user456,400.75
  2023-09-03T12:47:00Z,txn67890,user123,300.5
  ```

  ###### Запуск теста
  ```
  cd task_1
  bundle exec rspec
  ```
- [Задача#2](https://github.com/ProfessorNemo/tt-reine/blob/master/task_2.rb)

  ###### Запуск
  
  ```
  ruby task_2.rb
  ```
- [Задача#3](https://github.com/ProfessorNemo/tt-reine/blob/master/task_3.rb)
- [Задача#4](https://github.com/ProfessorNemo/tt-reine/tree/master/task_4.rb)
