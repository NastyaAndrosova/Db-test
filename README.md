# Тестовое задание: Проектирование базы данных для записи к врачу

## Используемые таблицы
1. `doctors`: содержит информацию о врачах.
2. `clients`: информация о клиентах.
3. `work_hours`: график работы врачей.
4. `time_slots`: доступные временные интервалы.
5. `appointments`: записи на приём.
6. `missed_appointments`: пропущенные записи с указанием причин.

## Особенности реализации
- Ссылочная целостность: `FOREIGN KEY` между таблицами.
- Ограничения уникальности: время записи (`doctor_id`, `date`, `time_start`, `time_end`).
- Использование ENUM для статусов записи.
- Гибкость для разной длины слотов.
- Предполагается использовать триггеры для проверки пересечения времени между разными клиентами и для проверки времени работы врачей на обновление и создание записи.
