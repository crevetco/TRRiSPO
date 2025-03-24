#!/bin/bash
set -e

EXECUTABLE="./my_program"

# Функция для запуска теста
run_test() {
    local test_name="$1"
    local input="$2"
    local expected_output="$3"
    
    echo "Running test: $test_name"
    
    # Запуск программы с перенаправлением ввода/вывода
    actual_output=$(echo -e "$input" | $EXECUTABLE 2>&1 | sed -n '/Sorted array:/p')
    
    # Проверка результата
    if [[ "$actual_output" == *"$expected_output"* ]]; then
        echo "Test passed"
    else
        echo "Test failed"
        echo "Expected: '$expected_output'"
        echo "Actual:   '$actual_output'"
        exit 1
    fi
}

# Тест 1: Корректные данные
input1="3\n5\n-2\n10"
expected1="Sorted array: -2 5 10"
run_test "Basic sorting" "$input1" "$expected1"

# Тест 2: Отрицательные числа и граничные значения
input2="4\n-100\n100\n0\n42"
expected2="Sorted array: -100 0 42 100"
run_test "Negative and boundary values" "$input2" "$expected2"

# Тест 3: Исправление некорректного ввода
input3="0\n5\nabc\n12\n999\n-50\n30\n40\n20\n10"
expected3="Sorted array: -50 10 20 30 40"
run_test "Error correction" "$input3" "$expected3"

# Тест 4: Минимальный случай
input4="1\n42"
expected4="Sorted array: 42"
run_test "Single element" "$input4" "$expected4"

echo "All tests passed successfully!"