#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <linux/kd.h>                 /* IOCTLs del teclado */
#include <sys/ioctl.h>                /* Funcion ioctl() */
#include <sys/types.h>
#define ERROR -1
void print_kbleds(long int arg);
int main(void) {
int fd;                  /* fd de la consola (/dev/tty), para usar en ioctl() */
long int state;          /* Entero para guardar el estado de los LEDs         */
/* Para usar como fd en ioctl() */
 if ((fd = open("/dev/tty", O_NOCTTY)) == ERROR) {
        perror("open: Couldn't open /dev/tty");
        exit(ERROR);
}
/* El estado de los LEDs se guarda en state */
if (ioctl(fd, KDGETLED, &state) == ERROR) {
        perror("ioctl: Couldn't do KDGETLED IOCTL");
        close(fd);
        exit(ERROR);
        }
        /* Imprimimos el estado de los LEDs */
        print_kbleds(state);
        return 0;
}
void print_kbleds(long int state) {
        /* LED_SCR = 0x1, LED_NUM = 0x2, LED_CAP = 0x4 */
        if (state & LED_SCR) printf("Scroll Lock LED is on. \n ");
        if (state & LED_NUM) printf("Num Lock LED is on. \n ");
        if (state & LED_CAP) printf("Caps Lock LED is on. \n ");
}

