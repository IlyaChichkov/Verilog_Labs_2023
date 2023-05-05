#define __riscv__
#define LED_DELAY 1000000

#include <gpio.h>
#include <uart.h>
#include <pulpino.h>
#include <kuznechik.h>

void cipher(){
  char input_data[16];
  int i = 0;
  
  // Read data from uart
  for (i = 15; i >= 0; i--)
  {
    input_data[i] = uart_getchar();
  }

  // Write data to cipher "kuznechik"
  cipher_write_data((unsigned int *)input_data);

  // Read encoded data
  char encoded_msg[16];
  cipher_read_data((unsigned int *)encoded_msg);
  
  char buff[16];
  for (i = 0; i < 16; i++)
  {
    buff[15 - i] = encoded_msg[i];
  }

  // Send encoded data through UART
  uart_send(buff, 16);
  uart_wait_tx_done();
}

int main()
{
  uart_set_cfg(0, 325); // 325 - 9600 baud UART, no parity (50MHz CPU)

  cipher_init();

  while(1) {
    cipher();
  }
}
