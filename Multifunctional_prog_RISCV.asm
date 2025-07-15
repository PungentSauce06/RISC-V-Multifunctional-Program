.data
# Main Menu Messages
main_menu:    .asciz "Main Menu:\n1) Quiz Game\n2) Fibonacci Series\n3) Calculator\n4) Exit\nEnter your choice: "
invalid_opt:  .asciz "Invalid option! Try again.\n"

# Quiz Game Messages
msg_welcome:   .asciz "Welcome to the Quiz Game!\n"
msg_question1: .asciz "1. What is 2 + 2?\n 1) 3\n 2) 4\n 3) 5\nYour answer: "
msg_question2: .asciz "2. What is the capital of France?\n 1) Berlin\n 2) Madrid\n 3) Paris\nYour answer: "
msg_question3: .asciz "3. What is the color of the sky?\n 1) Blue\n 2) Green\n 3) Red\nYour answer: "
msg_question4: .asciz "4. What is the largest planet in our solar system?\n 1) Earth\n 2) Mars\n 3) Jupiter\nYour answer: "
msg_question5: .asciz "5. Who wrote 'Romeo and Juliet'?\n 1) William Shakespeare\n 2) Charles Dickens\n 3) Mark Twain\nYour answer: "
msg_correct:   .asciz "Correct!\n"
msg_incorrect: .asciz "Incorrect.\n"
msg_end:       .asciz "Quiz Over! Thanks for playing!\n"

# Fibonacci Messages
msg_prompt:  .asciz "Enter the length of the Fibonacci series: "
msg_result:  .asciz "The Fibonacci series is: \n"

# Calculator Messages
prompt1:   .asciz "Enter first number: "
prompt2:   .asciz "Enter second number: "
prompt_op: .asciz "Enter operation (+, -, *, /): "
error_msg: .asciz "Invalid operation!\n"
result_msg: .asciz "Result: "

# Shared Variables
score:     .word 0          # Player's score
operation: .space 2         # For calculator operation input

.text
.globl _start

# Entry Point
_start:
main_menu_loop:
    # Display Main Menu
    la a0, main_menu
    li a7, 4                 # Print string syscall
    ecall

    # Read User Choice
    li a7, 5                 # Read integer syscall
    ecall
    mv t0, a0                # Store user choice in t0

    # Branch to Selected Option
    li t1, 1
    beq t0, t1, quiz_game    # Choice 1: Quiz Game
    li t1, 2
    beq t0, t1, fibonacci    # Choice 2: Fibonacci Series
    li t1, 3
    beq t0, t1, calculator   # Choice 3: Calculator
    li t1, 4
    beq t0, t1, exit_program # Choice 4: Exit
    j invalid_choice         # Handle invalid choice

invalid_choice:
    la a0, invalid_opt       # Load invalid option message
    li a7, 4                 # Print string syscall
    ecall
    j main_menu_loop         # Return to main menu

# Quiz Game Implementation
quiz_game:
    # Display Welcome Message
    li a7, 4             # Syscall for print_string
    la a0, msg_welcome   # Load address of welcome message
    ecall                # Print the message

    # Ask the first question
    li a7, 4             # Syscall for print_string
    la a0, msg_question1 # Load address of the first question
    ecall                # Print the question

    # Read answer (from user input)
    li a7, 5             # Syscall for read_int
    ecall                # Read answer into a0

    # Check if answer is correct (Answer should be 2)
    li t0, 2             # Correct answer is 2
    beq a0, t0, correct_answer1 # If answer is 2, go to correct_answer1
    li a0, 0             # Otherwise, answer is incorrect
    j incorrect_answer

correct_answer1:
    # Correct answer for question 1
    li a0, 1             # Set score to 1 for correct answer
    j continue_quiz

incorrect_answer:
    # Incorrect answer for question 1
    li a0, 0             # Set score to 0 for incorrect answer

continue_quiz:
    # Update score
    la t1, score         # Load address of score variable
    lw t2, 0(t1)         # Load current score
    add t2, t2, a0       # Add result (1 or 0)
    sw t2, 0(t1)         # Store updated score

    # Ask the second question
    li a7, 4             # Syscall for print_string
    la a0, msg_question2 # Load address of the second question
    ecall                # Print the question

    # Read answer for the second question
    li a7, 5             # Syscall for read_int
    ecall                # Read answer into a0

    # Check if answer is correct (Answer should be 3)
    li t0, 3             # Correct answer is 3
    beq a0, t0, correct_answer2 # If answer is 3, go to correct_answer2
    li a0, 0             # Otherwise, answer is incorrect
    j incorrect_answer2

correct_answer2:
    # Correct answer for question 2
    li a0, 1             # Set score to 1 for correct answer
    j continue_quiz2

incorrect_answer2:
    # Incorrect answer for question 2
    li a0, 0             # Set score to 0 for incorrect answer

continue_quiz2:
    # Update score
    la t1, score         # Load address of score variable
    lw t2, 0(t1)         # Load current score
    add t2, t2, a0       # Add result (1 or 0)
    sw t2, 0(t1)         # Store updated score

    # Ask the third question
    li a7, 4             # Syscall for print_string
    la a0, msg_question3 # Load address of the third question
    ecall                # Print the question

    # Read answer for the third question
    li a7, 5             # Syscall for read_int
    ecall                # Read answer into a0

    # Check if answer is correct (Answer should be 1)
    li t0, 1             # Correct answer is 1
    beq a0, t0, correct_answer3 # If answer is 1, go to correct_answer3
    li a0, 0             # Otherwise, answer is incorrect
    j incorrect_answer3

correct_answer3:
    # Correct answer for question 3
    li a0, 1             # Set score to 1 for correct answer
    j continue_quiz3

incorrect_answer3:
    # Incorrect answer for question 3
    li a0, 0             # Set score to 0 for incorrect answer

continue_quiz3:
    # Update score
    la t1, score         # Load address of score variable
    lw t2, 0(t1)         # Load current score
    add t2, t2, a0       # Add result (1 or 0)
    sw t2, 0(t1)         # Store updated score

    # Ask the fourth question
    li a7, 4             # Syscall for print_string
    la a0, msg_question4 # Load address of the fourth question
    ecall                # Print the question

    # Read answer for the fourth question
    li a7, 5             # Syscall for read_int
    ecall                # Read answer into a0

    # Check if answer is correct (Answer should be 3)
    li t0, 3             # Correct answer is 3
    beq a0, t0, correct_answer4 # If answer is 3, go to correct_answer4
    li a0, 0             # Otherwise, answer is incorrect
    j incorrect_answer4

correct_answer4:
    # Correct answer for question 4
    li a0, 1             # Set score to 1 for correct answer
    j continue_quiz4

incorrect_answer4:
    # Incorrect answer for question 4
    li a0, 0             # Set score to 0 for incorrect answer

continue_quiz4:
    # Update score
    la t1, score         # Load address of score variable
    lw t2, 0(t1)         # Load current score
    add t2, t2, a0       # Add result (1 or 0)
    sw t2, 0(t1)         # Store updated score

    # Ask the fifth question
    li a7, 4             # Syscall for print_string
    la a0, msg_question5 # Load address of the fifth question
    ecall                # Print the question

    # Read answer for the fifth question
    li a7, 5             # Syscall for read_int
    ecall                # Read answer into a0

    # Check if answer is correct (Answer should be 1)
    li t0, 1             # Correct answer is 1
    beq a0, t0, correct_answer5 # If answer is 1, go to correct_answer5
    li a0, 0             # Otherwise, answer is incorrect
    j incorrect_answer5

correct_answer5:
    # Correct answer for question 5
    li a0, 1             # Set score to 1 for correct answer
    j continue_quiz5

incorrect_answer5:
    # Incorrect answer for question 5
    li a0, 0             # Set score to 0 for incorrect answer

continue_quiz5:
    # Update score
    la t1, score         # Load address of score variable
    lw t2, 0(t1)         # Load current score
    add t2, t2, a0       # Add result (1 or 0)
    sw t2, 0(t1)         # Store updated score

    # Display Final Score
    li a7, 4             # Syscall for print_string
    la a0, msg_end       # Load address of the end message
    ecall                # Print the message

    # Display the score
    li a7, 1             # Syscall for print_int
    la t1, score         # Load address of score variable
    lw a0, 0(t1)         # Load score
    ecall                # Print the score
    j main_menu_loop

# Fibonacci Series Implementation
fibonacci:
    # Prompt the user for the Fibonacci series length
    la a0, msg_prompt
    li a7, 4
    ecall

    li a7, 5                 # Read integer syscall
    ecall
    mv t0, a0                # Store the length in t0

    # Display Fibonacci series
    la a0, msg_result
    li a7, 4
    ecall

    # Initialize first two Fibonacci numbers
    li t1, 0
    li t2, 1
    li t3, 2

    # Print Fib[0]
    mv a0, t1
    li a7, 1
    ecall
    li a7, 11                # Print newline
    li a0, 10
    ecall

    # Print Fib[1]
    mv a0, t2
    li a7, 1
    ecall
    li a7, 11
    li a0, 10
    ecall

fib_loop:
    bge t3, t0, end_fib      # If t3 >= length, exit loop
    add t4, t1, t2           # Fib[n] = Fib[n-1] + Fib[n-2]
    mv t1, t2
    mv t2, t4

    mv a0, t4                # Print Fib[n]
    li a7, 1
    ecall
    li a7, 11
    li a0, 10
    ecall

    addi t3, t3, 1
    j fib_loop

end_fib:
    j main_menu_loop         # Return to main menu

# Calculator Implementation
calculator:
    # Prompt for first number
    la a0, prompt1
    li a7, 4
    ecall
    li a7, 5
    ecall
    mv t0, a0                # Store first number

    # Prompt for second number
    la a0, prompt2
    li a7, 4
    ecall
    li a7, 5
    ecall
    mv t1, a0                # Store second number

    # Prompt for operation
    la a0, prompt_op
    li a7, 4
    ecall
    li a7, 8
    la a0, operation
    li a1, 2
    ecall

    # Perform Calculation
    lb t2, operation         # Load operation
    li t3, '+'
    beq t2, t3, do_add
    li t3, '-'
    beq t2, t3, do_sub
    li t3, '*'
    beq t2, t3, do_mul
    li t3, '/'
    beq t2, t3, do_div
    j invalid_op_calc

do_add:
    add t3, t0, t1
    j print_calc_result
do_sub:
    sub t3, t0, t1
    j print_calc_result
do_mul:
    mul t3, t0, t1
    j print_calc_result
do_div:
    beqz t1, invalid_op_calc
    div t3, t0, t1
    j print_calc_result

invalid_op_calc:
    la a0, error_msg
    li a7, 4
    ecall
    j main_menu_loop

print_calc_result:
    la a0, result_msg
    li a7, 4
    ecall
    mv a0, t3
    li a7, 1
    ecall

    j main_menu_loop

# Exit Program
exit_program:
    li a7, 10                # Exit syscall
    ecall
