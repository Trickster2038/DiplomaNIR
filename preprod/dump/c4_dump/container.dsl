workspace {

    model {
        # user = person softwareSystem "Пользователь" 
        
        softwareSystem_web = softwareSystem "Веб-приложение образовательного портала" "Предоставляет web-интерфейс, управляет аккаунтами и т.д."
        db = softwareSystem "База данных" "Хранит информацию о заданиях и статистике их прохождения" "DB"
        
        
        softwareSystem_HDL = softwareSystem "Подсистема тестирования знаний языков описания аппаратуры" {
                gateway = container "Основной микросервис" "Реализует верхнеуровневую логику подсистемы" "Golang"
                crud = container "Микросервис взаимодействия с БД" "Реализует программную обертку для работы с таблицами БД" "Golang, MySqlDriver"
                
                compiler = container "Микросервис синтеза устройств" "Синтезирует и тестирует (генерирует временные диаграммы  *.vcd) устройств, описанных на Verilog" "Golang, Icarus Verilog"
                parser =  container "Микросервис разбора временных диаграмм" "Преобразует формат временных диаграмм из *.vcd в JSON" "Python, Flask, PyDigitalWaveTools"
                wavedrom = container "Микросервис генерации временных диаграмм wavedrom" "Преобразует формат временых диаграмм в JSON в нотацию wavedrom" "Golang"
                analyser = container "Микросервис анализа решений" "Проверяет и анализирует ответы на задания" "Golang"
               
                statistics = container "Микросервис анализа статистики" "Анализирует статистику выполнения заданий" "Golang, MySqlDriver"
        }
        
        live = deploymentEnvironment "Live" {
            deploymentNode "Server 1" {
                gateway -> crud "Запрашивает выполнение операций над данным" "JSON/HTTP"
                gateway -> statistics "Запрашивает статистику выполнения заданий" "JSON/HTTP"
                
                gateway -> compiler "Отправляет Verilog-код с целью получить временную диаграмму (*.vcd) работы устройства" "JSON/HTTP"
                gateway -> parser "Отправялет *.vcd для преобразования в JSON" "JSON/HTTP"
                gateway -> wavedrom "Отправляет временную диаграмму в JSON для преобразования в нотацию wavedrom" "JSON/HTTP"
                gateway -> analyser "Отправляет ответ и условия задания для проверки и анализа" "JSON/HTTP"
            }
        }
        
        crud -> db "Выполняет операции над данным" "ODBC"
        statistics -> db "Считывает историю выполнения заданий" "ODBC"

        softwareSystem_web -> gateway "Обращается к API подсистемы" "JSON/HTTP"
        softwareSystem_web -> db "Работает с данными пользователей и независимыми таблицами" "TCP"
        
    }

    views {
        container softwareSystem_HDL {
            include *
            # autolayout lr
        }

        deployment softwareSystem_HDL live {
            include *
            # autolayout 
        }
        
        styles {
            element "Container" {
                background #1168bd
                color #ffffff
            }
            element "Software System" {
                background #999999
                color #ffffff
            }
            element "DB" {
                shape cylinder
                background #08427b
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
        
    }
    
}
