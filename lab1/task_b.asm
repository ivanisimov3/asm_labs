# Задание: Напишите программу на ассемблере RISC-V, которая принимает на вход целое число x 
# и выводит все значения в диапазоне min(x, y)...max(x, y) с шагом h. Где y – номер группы, h – номер студента в группе.

.data
y: .word 126 # Номер группы, М3О-126СВ-22
h: .word 1 # Анисимов Иван Александрович, вариант 1

.text
main:
    li a7, 5 # Reads an int from input console
    ecall
    
    mv t0, a0 # Сохраняем ввод пользователя X в t0
    
    # Далее будем в t3 хранить min, в t4 хранить max
    
    lw t1, y
    lw t2, h
    
    blt t0, t1, input_lower
    
    # Иначе
    mv t3, t1
    mv t4, t0
    
    j init_while
    
input_lower:
    mv t3, t0
    mv t4, t1
    
init_while:
    mv t5, t3 # Подготавливаем while, t5 - счетчик
    
print_nums:
    bgt t5, t4, end_cycle
    
    mv a0, t5
    li a7, 1
    ecall
    
    li a0, 10 # The ASCII value for \n (newline / line feed) is 10 in decimal
    li a7, 11 # Prints an ascii character
    ecall
    
    add t5, t5, t2 # Увеличиваем счетчик на h
    j print_nums
    
end_cycle:
    li a7, 10 # Exits the program with code 0
    ecall