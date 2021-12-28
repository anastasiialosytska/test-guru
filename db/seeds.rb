users = User.create({first_name: 'Sergey', last_name: 'Ivanov', email: 'sergey.ivanov@gmail.com'},
                    {first_name: 'Anton', last_name: 'Sidorov', email: 'anton.sidorov@gmail.com'},
                    {first_name: 'Nikolay', last_name: 'Sergeev', email: 'nikolay.sergeev@gmail.com'},
                    {first_name: 'Elena', last_name: 'Petrova', email: 'elena.petrova@gmail.com'},
                    {first_name: 'Marina', last_name: 'Antonova', email: 'marina.antonova@gmail.com'})

categories = Category.create({title: 'Ruby'}, {title: 'JavaScript'})

tests = Test.create({title: 'Тест на знание основ Ruby', category_id: categories[0].id},
                    {title: 'Тест на знание основ JavaScript', category_id: categories[1].id})

questions = Question.create({body: 'В каком варианте вы получите число без пропуска строки от пользователя?', test_id: tests[0].id},
                            {body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: tests[0].id},
                            {body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: tests[0].id},
                            {body: 'Чем отличается puts от print?', test_id: tests[0].id},
                            {body: 'Где записана сокращенная форма кода x = x/3?', test_id: tests[0].id},
                            {body: 'Есть ли различия между проверками if( x <= 100 ) и if( !(x > 100) )?', test_id: tests[1].id},
                            {body: 'Что выведет этот код alert( 20e-1[toString](2) )?', test_id: tests[1].id},
                            {body: 'Какие из этих вызовов синтаксически верно сгенерируют исключение?', test_id: tests[1].id},
                            {body: 'Объявлена функция function F() {}. Чем является F.prototype?', test_id: tests[1].id},
                            {body: 'Что делает код break me?', test_id: tests[1].id})

answers = Answer.create({body: 'num = gets', question_id: questions[0].id}, {body: 'num = gets.chomp().to_i', question_id: questions[0].id},
                        {body: 'num = gets.chomp()', question_id: questions[0].id}, {body: 'Ruby Web', question_id: questions[1].id},
                        {body: 'Ruby Framework', question_id: questions[1].id}, {body: 'Ruby On Rails', question_id: questions[1].id},
                        {body: 'Upcase()', question_id: questions[2].id}, {body: 'down()', question_id: questions[2].id},
                        {body: 'downcase()', question_id: questions[2].id}, {body: 'x /= 3', question_id: questions[4].id},
                        {body: 'x = / 3', question_id: questions[4].id}, {body: 'Нет сокращенной формы', question_id: questions[4].id},
                        {body: 'print без пропуска строки, а puts с пропуском', question_id: questions[3].id},
                        {body: 'Ничем, оба делают одно и тоже', question_id: questions[3].id},
                        {body: 'puts позволяет выводить переменные, а print только текст', question_id: questions[3].id},
                        {body: 'Да, существует значение x, для которого они работают по-разному', question_id: questions[5].id},
                        {body: 'Нет, они полностью взаимозаменяемы', question_id: questions[5].id},
                        {body: 'Зависит от браузера', question_id: questions[5].id}, {body: '2', question_id: questions[6].id},
                        {body: '10', question_id: questions[6].id}, {body: '20', question_id: questions[6].id},
                        {body: 'throw "Ошибка"', question_id: questions[7].id}, {body: 'throw new Error("Ошибка")', question_id: questions[7].id},
                        {body: 'throw { message: "Ошибка" }', question_id: questions[7].id},
                        {body: 'Обычным объектом', question_id: questions[8].id}, {body: 'Функцией', question_id: questions[8].id},
                        {body: 'Равен undefined', question_id: questions[8].id},
                        {body: 'Ломает интерпретатор javascript', question_id: questions[9].id},
                        {body: 'Выходит из текущего блока цикла или switch на метку «me»', question_id: questions[9].id},
                        {body: 'Выдает ошибку', question_id: questions[9].id})
