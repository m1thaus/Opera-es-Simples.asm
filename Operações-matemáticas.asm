section .text
    global _start

_start:
    ; Definir os valores (por exemplo, 10 e 5)
    mov eax, 10      ; Primeiro número
    mov ebx, 5       ; Segundo número

    ; Soma (eax = eax + ebx)
    add eax, ebx
    call print_number ; Imprime o resultado da soma

    ; Subtração (eax = eax - ebx)
    mov eax, 10      ; Reset eax para 10
    sub eax, ebx
    call print_number ; Imprime o resultado da subtração

    ; Multiplicação (eax = eax * ebx)
    mov eax, 10      ; Reset eax para 10
    mov ebx, 5
    mul ebx          ; EAX = EAX * EBX
    call print_number ; Imprime o resultado da multiplicação

    ; Divisão (eax = eax / ebx)
    mov eax, 10      ; Reset eax para 10
    mov ebx, 5
    xor edx, edx     ; Zerar EDX antes da divisão
    div ebx          ; EAX = EAX / EBX, resto em EDX
    call print_number ; Imprime o resultado da divisão

    ; Encerrar o programa
    mov eax, 1       ; syscall exit
    xor ebx, ebx     ; código de saída 0
    int 0x80

; -----------------------------------
; Função para imprimir número em EAX
; -----------------------------------
print_number:
    push eax
    push ecx
    push edx
    push ebx

    mov ecx, buffer  ; Posição do buffer
    mov ebx, 10      ; Base decimal
    add ecx, 10      ; Fim do buffer

convert_loop:
    dec ecx
    xor edx, edx
    div ebx          ; Divide EAX por 10, resto em EDX
    add dl, '0'      ; Converte para caractere
    mov [ecx], dl
    test eax, eax
    jnz convert_loop

    ; Imprimir string convertida
    mov eax, 4       ; syscall write
    mov ebx, 1       ; file descriptor stdout
    mov edx, 10      ; Número máximo de caracteres
    int 0x80

    ; Imprimir quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    pop ebx
    pop edx
    pop ecx
    pop eax
    ret

section .bss
    buffer resb 10   ; Buffer para armazenar número convertido

section .data
    newline db 0x0A  ; Caractere de nova linha
