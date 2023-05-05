// _KUZNECHIK_H_
#ifndef _KUZNECHIK_H_
#define _KUZNECHIK_H_

#include <pulpino.h>

#define CIPHER_REG_ADDR_RST                 ( CIPHER_BASE_ADDR + 0x00 )
#define CIPHER_REG_ADDR_REQ                 ( CIPHER_BASE_ADDR + 0x04 )
#define CIPHER_REG_ADDR_ACK                 ( CIPHER_BASE_ADDR + 0x08 )
#define CIPHER_REG_ADDR_VALID               ( CIPHER_BASE_ADDR + 0x0C )
#define CIPHER_REG_ADDR_BUSY                ( CIPHER_BASE_ADDR + 0x10 )
#define CIPHER_REG_ADDR_DATA_IN_0           ( CIPHER_BASE_ADDR + 0x14 )
#define CIPHER_REG_ADDR_DATA_IN_1           ( CIPHER_BASE_ADDR + 0x18 )
#define CIPHER_REG_ADDR_DATA_IN_2           ( CIPHER_BASE_ADDR + 0x1C )
#define CIPHER_REG_ADDR_DATA_IN_3           ( CIPHER_BASE_ADDR + 0x20 )
#define CIPHER_REG_ADDR_DATA_OUT_0          ( CIPHER_BASE_ADDR + 0x24 )
#define CIPHER_REG_ADDR_DATA_OUT_1          ( CIPHER_BASE_ADDR + 0x28 )
#define CIPHER_REG_ADDR_DATA_OUT_2          ( CIPHER_BASE_ADDR + 0x2C )
#define CIPHER_REG_ADDR_DATA_OUT_3          ( CIPHER_BASE_ADDR + 0x30 )


#define CIPHER_ADDR_RST                  REG( CIPHER_REG_ADDR_RST        )
#define CIPHER_ADDR_REQ                  REG( CIPHER_REG_ADDR_REQ        )
#define CIPHER_ADDR_ACK                  REG( CIPHER_REG_ADDR_ACK        )
#define CIPHER_ADDR_VALID                REG( CIPHER_REG_ADDR_VALID      )
#define CIPHER_ADDR_BUSY                 REG( CIPHER_REG_ADDR_BUSY       )
#define CIPHER_ADDR_DATA_IN_0            REG( CIPHER_REG_ADDR_DATA_IN_0  )
#define CIPHER_ADDR_DATA_IN_1            REG( CIPHER_REG_ADDR_DATA_IN_1  )
#define CIPHER_ADDR_DATA_IN_2            REG( CIPHER_REG_ADDR_DATA_IN_2  )
#define CIPHER_ADDR_DATA_IN_3            REG( CIPHER_REG_ADDR_DATA_IN_3  )
#define CIPHER_ADDR_DATA_OUT_0           REG( CIPHER_REG_ADDR_DATA_OUT_0 )
#define CIPHER_ADDR_DATA_OUT_1           REG( CIPHER_REG_ADDR_DATA_OUT_1 )
#define CIPHER_ADDR_DATA_OUT_2           REG( CIPHER_REG_ADDR_DATA_OUT_2 )
#define CIPHER_ADDR_DATA_OUT_3           REG( CIPHER_REG_ADDR_DATA_OUT_3 )


void cipher_init(void);

void cipher_reset(void);

void cipher_write_data(unsigned int[]);

void cipher_read_data(unsigned int[]);

#endif // _KUZNECHIK_H
