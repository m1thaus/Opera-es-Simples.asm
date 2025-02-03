# Operacoes_Simples.asm
Este projeto contém um programa escrito em Assembly x86 (NASM) que realiza operações matemáticas básicas (soma, subtração, multiplicação e divisão) e exibe os resultados no terminal.

Assembly Math Operations

Este projeto contém um programa escrito em Assembly x86 (NASM) que realiza operações matemáticas básicas (soma, subtração, multiplicação e divisão) e exibe os resultados no terminal.

📌 Funcionalidades

Soma de dois números

Subtração de dois números

Multiplicação de dois números

Divisão de dois números

Exibição dos resultados no terminal

🛠️ Requisitos

Linux (ou WSL no Windows)

NASM (Montador para Assembly)

LD (Linker para gerar o executável ELF)

🚀 Como Compilar e Executar

1️⃣ Instale o NASM (se ainda não estiver instalado)

sudo apt update && sudo apt install nasm -y

2️⃣ Compile o programa

nasm -f elf32 math.asm -o math.o

3️⃣ Link o arquivo objeto para gerar o executável

ld -m elf_i386 math.o -o math

4️⃣ Execute o programa

./math

📄 Código

O programa inicializa dois números (10 e 5), executa operações matemáticas e exibe os resultados no terminal.

mov eax, 10      ; Primeiro número
mov ebx, 5       ; Segundo número

add eax, ebx     ; Soma
call print_number

mov eax, 10      ; Reset eax para 10
sub eax, ebx     ; Subtração
call print_number

mov eax, 10      ; Reset eax para 10
mul ebx          ; Multiplicação
call print_number

mov eax, 10      ; Reset eax para 10
xor edx, edx     ; Zerar EDX antes da divisão
div ebx          ; Divisão
call print_number

🏗️ Estrutura do Código

_start: Ponto de entrada principal do programa

print_number: Função que converte o valor de EAX para string e imprime no terminal

Seções:

.text: Código do programa

.data: Dados estáticos

.bss: Espaço para variáveis não inicializadas

🔗 Referências

Documentação NASM

System Calls no Linux x86
