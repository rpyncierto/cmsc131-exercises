global _start

section .data

    SYS_EXIT equ 60
    DAYS_IN_YEAR equ 365
    HOURS_IN_DAY equ 24

    age db 25         ; Age in years
    days dq 0         ; variable for storing days
    hours dq 0        ; variable for storing hours

section .text

_start:

    ; Convert age to days
    mov eax, DAYS_IN_YEAR       ; Number of days in a year
    mul qword [age]             ; Multiply age by number of days
    mov qword [days], rax       ; Store result in days

    ; Convert days to hours
    mov eax, HOURS_IN_DAY       ; Number of hours in a day
    mul qword [days]            ; Multiply days by number of hours
    mov qword [hours], rax      ; Store result in hours

    jmp exit_here        ; Exit program

; label for exiting program
exit_here:  
    mov rax, 60
    xor rdi, rdi
    syscall