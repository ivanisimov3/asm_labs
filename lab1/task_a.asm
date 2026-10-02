# Задание: Напишите программу на ассемблере RISC-V , которая принимает на вход целое число x и выводит 1, 
# если оно соответствует номеру студента в списке группы и  0, если не совпадает.

.data
student_number: .word 1 # Анисимов Иван Александрович, вариант 1

.text
main:
    li a7, 5 # Reads an int from input console
    ecall
    
    mv t0, a0 # Сохраняем ввод пользователя в t0
    
    lw t1, student_number # Загружаем контент по адресу метки
    beq t0, t1, eq
    
    li a0, 0 # Кладем в a0 вывод 0
    j output
    
eq:
    li a0, 1 # Кладем в a0 вывод 1
    
output:
    li a7, 1 # Prints an integer
    ecall
    
    li a7, 10 # Exits the program with code 0
    ecall
