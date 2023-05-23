
#define __riscv__
#define LED_DELAY 1000000

//#include <spi.h>
#include <gpio.h>
#include <uart.h>
//#include <utils.h>
#include <pulpino.h>
#include <sp2.h>

int shiftPressed = 0;

char code2char(unsigned int keyCode){
  char keyChar;
  if(keyCode == 0x12 || keyCode == 0x59){
    shiftPressed = 1;
    return '\0';
  }
  if(keyCode == 0x5A){
    return '\n';
  }

  switch(keyCode){
    case 0x15:
      keyChar = !shiftPressed ? 'q' : 'Q';
      break;
    case 0x1D:
      keyChar = !shiftPressed ? 'w' : 'W';
      break;
    case 0x24:
      keyChar = !shiftPressed ? 'e' : 'E';
      break;
    case 0x2D:
      keyChar = !shiftPressed ? 'r' : 'R';
      break;
    case 0x2C:
      keyChar = !shiftPressed ? 't' : 'T';
      break;
    case 0x35:
      keyChar = !shiftPressed ? 'y' : 'Y';
      break;
    case 0x3C:
      keyChar = !shiftPressed ? 'u' : 'U';
      break;
    case 0x43:
      keyChar = !shiftPressed ? 'i' : 'I';
      break;
    case 0x44:
      keyChar = !shiftPressed ? 'o' : 'O';
      break;
    case 0x4D:
      keyChar = !shiftPressed ? 'p' : 'P';
      break;
    case 0x54:
      keyChar = !shiftPressed ? '[' : '{';
      break;
    case 0x5B:
      keyChar = !shiftPressed ? ']' : '}';
      break;
    case 0x1C:
      keyChar = !shiftPressed ? 'a' : 'A';
      break;
    case 0x1B:
      keyChar = !shiftPressed ? 's' : 'S';
      break;
    case 0x23:
      keyChar = !shiftPressed ? 'd' : 'D';
      break;
    case 0x2B:
      keyChar = !shiftPressed ? 'f' : 'F';
      break;
    case 0x34:
      keyChar = !shiftPressed ? 'g' : 'G';
      break;
    case 0x33:
      keyChar = !shiftPressed ? 'h' : 'H';
      break;
    case 0x3B:
      keyChar = !shiftPressed ? 'j' : 'J';
      break;
    case 0x42:
      keyChar = !shiftPressed ? 'k' : 'K';
      break;
    case 0x4B:
      keyChar = !shiftPressed ? 'l' : 'L';
      break;
    case 0x4C:
      keyChar = !shiftPressed ? ';' : ':';
      break;
    case 0x52:
      keyChar = !shiftPressed ? '\'' : '"';
      break;
    case 0x1A:
      keyChar = !shiftPressed ? 'z' : 'Z';
      break;
    case 0x22:
      keyChar = !shiftPressed ? 'x' : 'X';
      break;
    case 0x21:
      keyChar = !shiftPressed ? 'c' : 'C';
      break;
    case 0x2A:
      keyChar = !shiftPressed ? 'v' : 'V';
      break;
    case 0x32:
      keyChar = !shiftPressed ? 'b' : 'B';
      break;
    case 0x31:
      keyChar = !shiftPressed ? 'n' : 'N';
      break;
    case 0x3A:
      keyChar = !shiftPressed ? 'm' : 'M';
      break;
    case 0x41:
      keyChar = !shiftPressed ? ',' : '<';
      break;
    case 0x49:
      keyChar = !shiftPressed ? '.' : '>';
      break;
    case 0x4A:
      keyChar = !shiftPressed ? '/' : '?';
      break;
    case 0x16:
      keyChar = !shiftPressed ? '1' : '!';
      break;
    case 0x1E:
      keyChar = !shiftPressed ? '2' : '@';
      break;
    case 0x26:
      keyChar = !shiftPressed ? '3' : '#';
      break;
    case 0x25:
      keyChar = !shiftPressed ? '4' : '$';
      break;
    case 0x2E:
      keyChar = !shiftPressed ? '5' : '%';
      break;
    case 0x36:
      keyChar = !shiftPressed ? '6' : '^';
      break;
    case 0x3D:
      keyChar = !shiftPressed ? '7' : '&';
      break;
    case 0x3E:
      keyChar = !shiftPressed ? '8' : '*';
      break;
    case 0x46:
      keyChar = !shiftPressed ? '9' : '(';
      break;
    case 0x45:
      keyChar = !shiftPressed ? '0' : ')';
      break;
    case 0x4E:
      keyChar = !shiftPressed ? '-' : 'F';
      break;
    case 0x55:
      keyChar = !shiftPressed ? '=' : 'F';
      break;
    case 0x29:
      keyChar = ' ';
      break;
    default:
      keyChar = '\0';
      break;
  }
  shiftPressed = 0;
  return keyChar;
}

int main()
{
  int i = 0;
  uart_set_cfg(0, 27); // 9600 baud UART, no parity (50MHz CPU)

  uart_send("-\n", 2); // 13 is a number of chars sent: 12 + "\n" 
  uart_wait_tx_done();

  set_pin_function(31, FUNC_GPIO);
  set_gpio_pin_direction(31, DIR_OUT);

  set_gpio_pin_value(31, 0);

  char key_data[32];
  unsigned int read_data;
  char key;

  sp2_init();

  while(1) {
    read_data = read_usb_key();
    char buff;
    buff = code2char(getKeyCode(read_data));
    uart_send(buff, 1);
    uart_wait_tx_done();

    // key = (char)(read_data) + '0';
    //uint2bits(key_data, read_data);
    //uart_send(key_data, 32);
    //uart_wait_tx_done();

    //uart_send("\n", 1);
    //uart_wait_tx_done();
/*

    char buff[2];
    buff[0] = (char)getKeyCode(read_data);
    buff[1] = '\0';
    uart_send(buff, 2);
    uart_wait_tx_done();

    char codeChar = code2char(getKeyCode(read_data));
    uart_send(codeChar, 1);
    uart_wait_tx_done();
*/
  }
}
