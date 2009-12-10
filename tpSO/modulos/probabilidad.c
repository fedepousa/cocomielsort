#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <asm/uaccess.h>
#include <linux/random.h> 

#define ALPHA_LEN ( 'Z' - 'A' + 1 )
#define ALPHA_OFFSET ( 'A' )
#define PROCFS_MAX_SIZE		1024
#define PROCFS_NAME 		"proba"

static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);
 
#define SUCCESS 0
#define DEVICE_NAME "probabilidad"	
#define BUF_LEN 80		

static int Major;		
static int Device_Open = 0;
static char msg[BUF_LEN];	
static char *msg_Ptr;

static int iLecturas = 0;
static unsigned char cLast = '\0';
static struct file_operations fops = {
	.read = device_read,
	.write = device_write,
	.open = device_open,
	.release = device_release
};


static struct proc_dir_entry *Our_Proc_File;
static char procfs_buffer[PROCFS_MAX_SIZE];
static unsigned long procfs_buffer_size = 0;

int procfile_read(char *buffer,char **buffer_location, off_t offset, int buffer_length, int *eof, void *data){
	int ret;
	sprintf(procfs_buffer, "%d", iLecturas );
	procfs_buffer_size = strlen (procfs_buffer);

	if (offset >=0){
		memcpy(buffer, procfs_buffer, procfs_buffer_size);
		ret = procfs_buffer_size;
	}else ret = 0;

	return ret;
}

int procfile_write(struct file *file, const char *buffer, unsigned long count, void *data){
	return count;
}

static int device_open(struct inode *inode, struct file *file){
	
	if (Device_Open)
		return -EBUSY;

	Device_Open++;
	
	get_random_bytes(&cLast, 1); 
	cLast = cLast % ALPHA_LEN;

	msg[0] = ALPHA_OFFSET + cLast;
	msg[1] = '\0';
	
	msg_Ptr = msg;
	
	iLecturas++;
	
	try_module_get(THIS_MODULE);

	return SUCCESS;
}

static int device_release(struct inode *inode, struct file *file){
	
	Device_Open--;		

	
	module_put(THIS_MODULE);

	return 0;
}

static ssize_t device_read(struct file *filp, char *buffer, size_t length, loff_t * offset){
	int bytes_read = 0;

	if (*msg_Ptr == 0) return 0;

	while (length && *msg_Ptr) {
		put_user(*(msg_Ptr++), buffer++);
		length--;
		bytes_read++;
	}
	return bytes_read;
}

static ssize_t
device_write(struct file *filp, const char *buff, size_t len, loff_t * off){
	return -EINVAL;
}

static int __init proba_init(void)
{
	Our_Proc_File = create_proc_entry(PROCFS_NAME, 0644, NULL);
	
	if (Our_Proc_File == NULL) {
		remove_proc_entry(PROCFS_NAME, &proc_root);
		printk(KERN_ALERT "Error: No se pudo inicializar /proc/%s\n", PROCFS_NAME);
		return -ENOMEM;
	}

	Our_Proc_File->read_proc  = procfile_read;
	Our_Proc_File->write_proc = procfile_write;
	Our_Proc_File->owner 	  = THIS_MODULE;
	Our_Proc_File->mode 	  = S_IFREG | S_IRUGO;
	Our_Proc_File->uid 	  = 0;
	Our_Proc_File->gid 	  = 0;
	Our_Proc_File->size   = 37;

	Major = register_chrdev(0, DEVICE_NAME, &fops);
	
	if (Major < 0) {
	  printk(KERN_ALERT "proba: No se pudo registrar el chardev con # Mayor %d\n", Major);
	  return Major;
	}

	return 0;
	
}

static void __exit proba_cleanup(void)
{
	remove_proc_entry(PROCFS_NAME, &proc_root);
	unregister_chrdev(Major, DEVICE_NAME);
	
	return;
}


module_init(proba_init);
module_exit(proba_cleanup);
