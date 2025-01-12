# UART
## **UART implementation using Verilog HDL**

### Summary

UART stands for Universal Asynchronous Receiver/Transmitter. It’s not a communication protocol like SPI and I2C, but a physical circuit in a microcontroller, or a stand-alone IC. A UART’s main purpose is to transmit and receive serial data. In UART communication, two UARTs communicate directly with each other. The transmitting UART converts parallel data from a controlling device like a CPU into serial form, and transmits it in serial to the receiving UART, which then converts the serial data back into parallel data for the receiving device. Only two wires are needed to transmit data between two UARTs. Data flows from the transmitting UART's Tx pin to the receiving UART's Rx pin.<br>The transmitting UART adds start and stop bits to the data packet being transferred. These bits define the beginning and end of the data packet so the receiving UART knows when to start reading the bits.
When the receiving UART detects a start bit, it starts to read the incoming bits at a specific frequency known as the baud rate. Baud rate is a measure of the speed of data transfer, expressed in bits per second (bps). Both UARTs must operate at about the same baud rate.

### Full Duplex UART
- Implemented a full duplex uart body from the two top modules [Transmitter.v](https://github.com/Praranya/UART_Protocol/blob/main/sources_1/new/transmitter.v) and [Receiver.v](https://github.com/Praranya/UART_Protocol/blob/main/sources_1/new/receiver.v).
- Design module [topmodule.v](https://github.com/Praranya/UART_Protocol/blob/main/sources_1/new/topmodule.v).
- Test bench [topmodule_test.v](https://github.com/Praranya/Uart/blob/main/UART_Body/topmodule_test.v).
- wave form:<br> ![alt text](https://github.com/Praranya/UART_Protocol/blob/main/Uart_protocol_pics/Capture.JPG)
- Synthesised block level diagram:<br>![alt text](https://github.com/Praranya/UART_Protocol/blob/main/Uart_protocol_pics/schematic.JPG)
- Block Diagram:<br>![alt text](https://github.com/Praranya/UART_Protocol/blob/main/Uart_protocol_pics/Block%20Diagram.JPG)
- FSM:<br>![alt text](https://github.com/Praranya/UART_Protocol/blob/main/Uart_protocol_pics/FSM.JPG)
