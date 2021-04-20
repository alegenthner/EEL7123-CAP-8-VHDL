# Relatório capítulo 8: VHDL

**Aluno**: Alexandre Hoffmann Genthner
**Matrícula:** 16103372

---

# Diagrama do circuito sendo simulado

<center>

![diagram.svg](https://github.com/kBytemann/EEL7123-CAP-8-VHDL/blob/8e07fc3c8e93c6b2aac13d27ca4270a2431b6a57/images/diagram.svg)

</center>

## Simulação na plataforma _online_

Para verificação de funcionalidade do circuito na placa de fpga, serão executados as seguintes entradas

<center>

||A = 15 = `1111b`|B = 15 = `1111b`|C = 15 = `1111b`|D = 15 = `1111b`|
|:---:|:---:|:---:|:---:|:---:|
|Valor esperado (decimal)|576|696|2496|8256|
|Valor esperado (hexadecimal)|`0x240`|`0x2B8`|`0x9C0`|`0x2040`|

</center>

![Imagem1.png](https://github.com/kBytemann/EEL7123-CAP-8-VHDL/blob/8e07fc3c8e93c6b2aac13d27ca4270a2431b6a57/images/Imagem1.png)
> Resultado para entrada A = `1111b` = 15.

![Imagem2.png](https://github.com/kBytemann/EEL7123-CAP-8-VHDL/blob/8e07fc3c8e93c6b2aac13d27ca4270a2431b6a57/images/Imagem2.png)
> Resultado para entrada B = `1111b` = 15.

![Imagem3.png](https://github.com/kBytemann/EEL7123-CAP-8-VHDL/blob/8e07fc3c8e93c6b2aac13d27ca4270a2431b6a57/images/Imagem3.png)
> Resultado para entrada C = `1111b` = 15.

![Imagem4.png](https://github.com/kBytemann/EEL7123-CAP-8-VHDL/blob/8e07fc3c8e93c6b2aac13d27ca4270a2431b6a57/images/Imagem4.png)
> Resultado para entrada D = `1111b` = 15.

Após uma verificação de outros valores, pode-se verificar a funcionalidade dos arquivos preparados para a emulação.
