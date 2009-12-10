#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int __init hello_init(void)
{
	printk(KERN_ALERT "Hola Kernel\n");
	return 0; /* Necesario para que cargue */
}

static void __exit hello_exit(void)
{
	printk(KERN_ALERT "Chau Kernel\n");
}

/*
 * Definimos cuales son las funciones a llamar
 * cuando se carga o descarga el modulo
 */
module_init(hello_init);
module_exit(hello_exit);

/* 
 * Declaramos el código como GPL
 */
MODULE_LICENSE("GPL");

