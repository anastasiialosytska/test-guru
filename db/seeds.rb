User.create(first_name: 'Sergey', last_name: 'Ivanov', email: 'sergey.ivanov@gmail.com')
User.create(first_name: 'Anton', last_name: 'Sidorov', email: 'anton.sidorov@gmail.com')
User.create(first_name: 'Nikolay', last_name: 'Sergeev', email: 'nikolay.sergeev@gmail.com')
User.create(first_name: 'Elena', last_name: 'Petrova', email: 'elena.petrova@gmail.com')
User.create(first_name: 'Marina', last_name: 'Antonova', email: 'marina.antonova@gmail.com')

category_1 = Category.create(title: 'Ruby')
category_2 = Category.create(title: 'JavaScript')

test_1 = Test.create(title: 'Тест на знание основ Ruby', category_id: category_1.id)
test_2 = Test.create(title: 'Тест на знание основ JavaScript', category_id: category_2.id)

question_1 = Question.create(body: 'В каком варианте вы получите число без пропуска строки от пользователя?', test_id: test_1.id)
question_2 = Question.create(body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: test_1.id)
question_3 = Question.create(body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: test_1.id)
question_4 = Question.create(body: 'Чем отличается puts от print?', test_id: test_1.id)
question_5 = Question.create(body: 'Где записана сокращенная форма кода x = x/3?', test_id: test_1.id)

question_6 = Question.create(body: 'Есть ли различия между проверками if( x <= 100 ) и if( !(x > 100) )?', test_id: test_2.id)
question_7 = Question.create(body: 'Что выведет этот код alert( 20e-1[toString](2) )?', test_id: test_2.id)
question_8 = Question.create(body: 'Какие из этих вызовов синтаксически верно сгенерируют исключение?', test_id: test_2.id)
question_9 = Question.create(body: 'Объявлена функция function F() {}. Чем является F.prototype?', test_id: test_2.id)
question_10 = Question.create(body: 'Что делает код break me?', test_id: test_2.id)

Answer.create(body: 'num = gets', question_id: question_1.id)
Answer.create(body: 'num = gets.chomp().to_i', question_id: question_1.id)
Answer.create(body: 'num = gets.chomp()', question_id: question_1.id)
Answer.create(body: 'Ruby Web', question_id: question_2.id)
Answer.create(body: 'Ruby Framework', question_id: question_2.id)
Answer.create(body: 'Ruby On Rails', question_id: question_2.id)
Answer.create(body: 'Upcase()', question_id: question_3.id)
Answer.create(body: 'down()', question_id: question_3.id)
Answer.create(body: 'downcase()', question_id: question_3.id)
Answer.create(body: 'x /= 3', question_id: question_5.id)
Answer.create(body: 'x = / 3', question_id: question_5.id)
Answer.create(body: 'Нет сокращенной формы', question_id: question_5.id)
Answer.create(body: 'print без пропуска строки, а puts с пропуском', question_id: question_4.id)
Answer.create(body: 'Ничем, оба делают одно и тоже', question_id: question_4.id)
Answer.create(body: 'puts позволяет выводить переменные, а print только текст', question_id: question_4.id)
Answer.create(body: 'Да, существует значение x, для которого они работают по-разному', question_id: question_6.id)
Answer.create(body: 'Нет, они полностью взаимозаменяемы', question_id: question_6.id)
Answer.create(body: 'Зависит от браузера', question_id: question_6.id)
Answer.create(body: '2', question_id: question_7.id)
Answer.create(body: '10', question_id: question_7.id)
Answer.create(body: '20', question_id: question_7.id)
Answer.create(body: 'throw "Ошибка"', question_id: question_8.id)
Answer.create(body: 'throw new Error("Ошибка")', question_id: question_8.id)
Answer.create(body: 'throw { message: "Ошибка" }', question_id: question_8.id)
Answer.create(body: 'Обычным объектом', question_id: question_9.id)
Answer.create(body: 'Функцией', question_id: question_9.id)
Answer.create(body: 'Равен undefined', question_id: question_9.id)
Answer.create(body: 'Ломает интерпретатор javascript', question_id: question_10.id)
Answer.create(body: 'Выходит из текущего блока цикла или switch на метку «me»', question_id: question_10.id)
Answer.create(body: 'Выдает ошибку', question_id: question_10.id)
