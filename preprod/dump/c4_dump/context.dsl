workspace {

    model {
        user = person "Пользователь" "Пользователь"
        softwareSystem_web = softwareSystem "Веб-приложение образовательного портала" "Предоставляет интерфейс пользователя, управляет аккаунтами и т.д." "Web"
        db = softwareSystem "База данных" "Хранит информацию о пользователях, заданиях и статистике их прохождения" "DB"
        softwareSystem_HDL = softwareSystem "Подсистема тестирования знаний языков описания аппаратуры" "Управляет образовательными материалами и проверяет задания"
        
        user -> softwareSystem_web "Обращается к интрефейсу системы" "HTTP"
        softwareSystem_web -> softwareSystem_HDL "Обращается к API подсистемы" "JSON/HTTP"
        softwareSystem_web -> db "Выполняет операции над данным пользователей и др" "ODBC"
        softwareSystem_HDL -> db "Выполняет операции над данным заданий и историей их выполнения" "ODBC"
    }

    views {
    
        systemContext softwareSystem_web {
            include *
        }
        
        styles {
            element "Web" {
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
        
        theme default
    }

}
