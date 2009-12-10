#include <linux/module.h>
#include <linux/init.h>
#include <linux/tty.h>		/* For fg_console, MAX_NR_CONSOLES */
#include <linux/kd.h>		/* For KDSETLED */
#include <linux/vt.h>
#include <linux/console_struct.h>/* For vc_cons */
#include <linux/kernel.h>	/* We're doing kernel work */
#include <linux/proc_fs.h>	/* Necessary because we use the proc fs */
#include <asm/uaccess.h>	/* for copy_from_user */

extern int fg_console;

struct tty_driver *my_driver;
char kbledstatus = 0;

#define BLINK_DELAY   HZ/5
#define ALL_LEDS_ON   0x07
#define RESTORE_LEDS  0xFF


static struct proc_dir_entry *Our_Proc_File;


int procfile_read(char *buffer,char **buffer_location, off_t offset, int buffer_length, int *eof, void *data){ 
return 0;
}

int procfile_write(struct file *file, const char *buffer, unsigned long count,void *data){
	int i=0;
	while ( (i < count) && (i < 5) ){
		char letra = buffer[i];
		// Q = NUMLOCK
		// W = CAPSLOCK
		// E = SCROLL LOCK
		// MAYUSCULA PARA PRENDER, MINUSCULA PARA APAGAR
		switch(letra){
			case 'q':
				kbledstatus = kbledstatus & 0xFD;	
				break;	
			case 'Q':
				//PARA PRENDER NUMLOCK
				kbledstatus = kbledstatus | 0x02;
				break;
			case 'w':
				/* Numlock off */
				kbledstatus = kbledstatus & 0xFB;		
				break;
			case 'W':
				/* Numlock on */
				kbledstatus = kbledstatus | 0x04;
				break;
			case 'e':
				/* Capslock off */
				kbledstatus = kbledstatus & 0xFE;
				break;
			case 'E':
				/* Scrollock on */
				kbledstatus = kbledstatus | 0x01; 
				break;
		}
		i++;
	}
	
	(my_driver->ioctl) (vc_cons[fg_console].d->vc_tty, NULL, KDSETLED,kbledstatus);
	return count;
}



static int __init kbproc_init(void){
	int i;
	for (i = 0; i < MAX_NR_CONSOLES; i++) {
		if (!vc_cons[i].d)
			break;
	}

	my_driver = vc_cons[fg_console].d->vc_tty->driver;
	Our_Proc_File = create_proc_entry("archivo_grupo5", 0644, NULL);
	
	if (Our_Proc_File == NULL) {
		remove_proc_entry("archivo_grupo5", &proc_root);
		return -ENOMEM;
	}

	Our_Proc_File->read_proc  = procfile_read;
	Our_Proc_File->write_proc = procfile_write;
	Our_Proc_File->owner 	  = THIS_MODULE;
	Our_Proc_File->mode 	  = S_IFREG | S_IRUGO;
	Our_Proc_File->uid 	  = 0;
	Our_Proc_File->gid 	  = 0;
	Our_Proc_File->size 	  = 37;

	return 0;	
	
}


static void __exit kbproc_cleanup(void){
	(my_driver->ioctl) (vc_cons[fg_console].d->vc_tty, NULL, KDSETLED, RESTORE_LEDS);
	remove_proc_entry("archivo_grupo5", &proc_root);
}

module_init(kbproc_init);
module_exit(kbproc_cleanup);
