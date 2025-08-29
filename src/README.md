# Risc V - Nguyen Ba Duc

1. R type

| Field   | Bit Range | Bits |
|---------|-----------|------|
| func7   | 31–25     | 7    |
| rs2     | 24–20     | 5    |
| rs1     | 19–15     | 5    |
| func3   | 14–12     | 3    |
| rd      | 11–7      | 5    |
| opcode  | 6–0       | 7    |

Example: 

| Instruction      | Function                     | func7  | rs2  | rs1  | func3 | rd  | opcode  | PCsel | Asel | Bsel | ALUsel | RegWEn | MemRW | WBsel |
|------------------|-----------------------------|--------|------|------|-------|-----|---------|-------|------|------|--------|--------|-------|-------|
| add x1, x2, x3   | x1 = x2 + x3 (integer add)  | 0000000| 00011| 00010| 000   | 00001| 0110011 | PC+4  | 0    | 0    | ADD    | 1      | 0     | ALU   |
