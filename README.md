# 🖥️ CompSim — RISC-V Assembly Lab

<div align="center">

![Assembly RISC-V](https://img.shields.io/badge/Assembly-RISC--V-blueviolet?style=for-the-badge)
![UFPE](https://img.shields.io/badge/UFPE-CIn-red?style=for-the-badge)
![Status](https://img.shields.io/badge/status-acadêmico-lightgrey?style=for-the-badge)
![Simulador](https://img.shields.io/badge/simulador-CompSim-orange?style=for-the-badge)

**Projeto acadêmico desenvolvido para a disciplina de Laboratório de Organização e Arquitetura de Computadores (CIN0012) — CIn/UFPE (2026)**

</div>

---

## 📌 Sobre o Projeto

Este repositório contém as implementações das atividades práticas realizadas no simulador **CompSim**, desenvolvido pelo Laboratório de Organização e Arquitetura de Computadores da UFPE. Todos os programas são escritos em **Assembly RISC-V**, explorando desde operações aritméticas simples até entrada/saída com periféricos virtuais como teclado, tela e Arduino.

O CompSim é uma plataforma de simulação baseada no paradigma *Platform Based Design (PBD)*, que permite criar, configurar e simular programas sobre uma plataforma virtual composta por CPU, memória cache, RAM e periféricos.

---

## 📁 Estrutura do Repositório

```
project2/
├── atividade1.asm   # Operações aritméticas e condicionais simples
├── atividade2.asm   # Estrutura if-else em Assembly RISC-V
├── atividade3.asm   # Desvio condicional com fluxograma
├── atividade4.asm   # Escrita de strings na tela (loop)
├── atividade5.asm   # Leitura do teclado e escrita na tela
└── atividade6.asm   # Entrada e saída na plataforma Arduino Virtual
```

| Arquivo | Descrição |
|---------|-----------|
| [`atividade1.asm`](atividade1.asm) | Soma de dois valores v1 e v2, resultado em v3 |
| [`atividade2.asm`](atividade2.asm) | Estrutura condicional: `if (b < m) m = a + b; else m = a - b` |
| [`atividade3.asm`](atividade3.asm) | Desvio condicional com igualdade (`i == j`) e operações sobre f, g, h |
| [`atividade4.asm`](atividade4.asm) | Impressão completa de string na tela via loop |
| [`atividade5.asm`](atividade5.asm) | Echo de caracteres lidos do teclado até `*` |
| [`atividade6.asm`](atividade6.asm) | Controle de LEDs com botão no Arduino Virtual |

---

## 🧩 Atividades

### Atividade 1 — Soma de Valores na Memória

**Arquivo:** [`atividade1.asm`](atividade1.asm)

Nesta atividade, dois valores `v1` e `v2` são armazenados na memória e carregados nos registradores. O programa realiza a soma dos dois e armazena o resultado no endereço de `v3`.

O objetivo é exercitar o uso das instruções `lw` (load word), `add` (adição entre registradores) e `sw` (store word), que são fundamentais em qualquer programa Assembly RISC-V.

**Casos de teste:**

| v1 | v2 | v3 (esperado) |
|----|----|---------------|
| 5  | 10 | 15            |
| 14 | 7  | 21            |
| 25 | 12 | 37            |

---

### Atividade 2 — Estrutura if-else

**Arquivo:** [`atividade2.asm`](atividade2.asm)

Implementação da seguinte estrutura de alto nível em Assembly RISC-V:

```c
int a = 6;
int b = 15;
int m = 0;

m = a;
if (b < m)
    m = a + b;
else
    m = a - b;
```

O programa usa a instrução `blt` (branch if less than) para implementar o desvio condicional. Os valores de `a` e `b` podem ser modificados conforme a tabela de casos de teste.

**Casos de teste:**

| a  | b  | m (esperado) |
|----|----|--------------|
| 6  | 15 | ?            |
| 14 | 7  | ?            |
| 25 | 12 | ?            |

---

### Atividade 3 — Desvio Condicional com Fluxograma

**Arquivo:** [`atividade3.asm`](atividade3.asm)

Implementação do seguinte fluxograma em Assembly RISC-V:

```
if (i == j)
    f = g + h
else
    f = g - h
```

As variáveis `f`, `g`, `h`, `i` e `j` estão armazenadas respectivamente nos registradores `x19`, `x20`, `x21`, `x22` e `x23`.

O desvio condicional usa a instrução `beq` (branch if equal). Quando `i == j`, o fluxo executa `f = g + h`; caso contrário, executa `f = g - h` via desvio para a label `Else`.

---

### Atividade 4 — Impressão de String na Tela (Loop)

**Arquivo:** [`atividade4.asm`](atividade4.asm)

Nesta atividade, o programa percorre uma string armazenada na memória **caractere por caractere** usando um loop, escrevendo cada byte na porta de vídeo (`0x400`) do CompSim.

A lógica envolve:
- Carregar o endereço base da string em um registrador
- Usar `lb` (load byte) para ler cada caractere
- Escrever o byte na porta de vídeo com `sb` (store byte)
- Incrementar o ponteiro e repetir até o terminador nulo

> 💡 **Dica:** A string é definida com a diretiva `.string "..."` e utiliza o terminador NUL (`\0`) para sinalizar o fim.

---

### Atividade 5 — Leitura do Teclado e Escrita na Tela

**Arquivo:** [`atividade5.asm`](atividade5.asm)

O programa lê continuamente caracteres do teclado virtual (porta `0x401`) e os exibe na tela (porta `0x400`), em um loop que só é finalizado quando o caractere `*` é digitado.

**Mapa de portas utilizado:**

| Periférico | Porta (Hex) | Operação |
|------------|-------------|----------|
| Vídeo      | `0x400`     | Escrita de caractere |
| Keyboard   | `0x401`     | Leitura de caractere |

> 💡 **Dica:** O código ASCII do `*` é `0x2A` (42 em decimal). Use a tabela ASCII disponível em `Tools > ASCII Table` no CompSim.

---

### Atividade 6 — Entrada e Saída na Plataforma Arduino Virtual

**Arquivo:** [`atividade6.asm`](atividade6.asm)

Configuração da plataforma CompSim para o Arduino Virtual e implementação de controle de LEDs com leitura de botão digital.

**Comportamento do sistema:**
- O sistema possui 6 LEDs conectados aos GPIOs 2 a 7
- Inicia com o LED da porta 2 aceso
- Quando o botão for pressionado, o LED da porta atual apaga e o seguinte acende
- Ao alcançar o LED 7, o sistema retorna ao início (porta 2)

**Portas utilizadas:**

| Periférico           | Porta (Dec) | Porta (Hex)    | Operação |
|----------------------|-------------|----------------|----------|
| Arduino – PortB (pin 8-13) | 1026  | `0x402`        | Leitura dos bits dos pinos |
| Arduino – PortC (pin A0-A5) | 1029 | `0x405`        | Escrita dos bits dos pinos |

> 💡 **Dica:** Use instruções de deslocamento (`slli`, `srli`) para controlar qual LED está aceso de forma eficiente.

---

## ⚙️ Como Usar o CompSim

1. **Baixar o simulador:** Acesse o arquivo `CompSimRISCVIntegrado.zip` disponível no link: http://compsim.crato.ifce.edu.br/download.html

2. **Extrair o `.zip`** na sua máquina
3. **Executar** o arquivo `CompSim.exe`
4. **Criar a plataforma:** No menu `Platform`, configure CPU, memória e periféricos conforme a atividade
5. **Editar o código:** Use o editor integrado (aba `Code`) para escrever seu programa Assembly
6. **Montar e simular:** Clique em `Run`, `Step` ou `Fast Run` para executar

---

## 📖 Instruções RISC-V Utilizadas

| Instrução | Sintaxe | Descrição |
|-----------|---------|-----------|
| `lw`  | `lw reg, desl(reg_base)` | Carrega word da memória |
| `sw`  | `sw reg, desl(reg_base)` | Salva word na memória |
| `lb`  | `lb reg, desl(reg_base)` | Carrega byte da memória |
| `sb`  | `sb reg, desl(reg_base)` | Salva byte na memória |
| `add` | `add regi, regj, regk` | Soma dois registradores |
| `addi`| `addi regi, regj, cte` | Soma registrador com imediato |
| `sub` | `sub regi, regj, regk` | Subtrai dois registradores |
| `and` | `and regi, regj, regk` | AND lógico |
| `beq` | `beq regi, regj, desl` | Desvia se `regi == regj` |
| `bne` | `bne regi, regj, desl` | Desvia se `regi != regj` |
| `jal` | `jal regi, desl` | Jump and link |
| `halt`| `halt` | Para a simulação |

---

## 🧠 Conceitos Abordados

- ✅ Controle de fluxo: desvios condicionais e incondicionais (`beq`, `bne`, `jal`)
- ✅ Acesso à memória: `lw`, `sw`, `lb`, `sb`
- ✅ Diretivas do assembler: `.word`, `.byte`, `.string`, `.align`
- ✅ E/S mapeada em memória (Memory-Mapped I/O)
- ✅ Loops em Assembly
- ✅ Periféricos virtuais: Vídeo, Teclado, Arduino

---

## 👥 Integrantes

| Nome          | E-mail               |
|---------------|----------------------|
| Caio Agrelli  | caarr@cin.ufpe.br    |
| Lucas David   | ldlf@cin.ufpe.br     |

---

## 🏫 Contexto Acadêmico

| Campo       | Informação                                               |
|-------------|----------------------------------------------------------|
| Disciplina  | Laboratório de Organização e Arquitetura de Computadores |
| Instituição | Centro de Informática – UFPE (CIn)                       |
| Professores | Edna Barros e Victor Medeiros                            |
| Simulador   | CompSim (v2.0.0a)                                        |
| Arquitetura | RISC-V RV32I                                             |
| Ano         | 2026                                                     |