# Pulpino project

### Description

Project based on open-source system based on RISC-V — [Pulpino](https://github.com/pulp-platform/pulpino/tree/master). Full realization of cipher on physical board Nexus Artix-7 100T with UART input and output through serial terminal of data and encoded message respectively.

### Setup

1. Create Vivado project `vivado -mode batch -nojournal -nolog -source vivado_project.tcl`
2. Build boot code `/sw/boot_code/ >> make`
3. Build application code `/sw/test_sw/ >> make`
3. Create bitstream in Vivado

### Software

- VS Code
- Vivado 2019.2
- CoolTerm 2.0.1

### Operation system

- Ubuntu 22.04

### Author

Github - [@IlyaChichkov](https://github.com/IlyaChichkov/)

Email - [ilya.chichkov.dev@gmail.com](mailto:ilya.chichkov.dev@gmail.com)
