#!/bin/bash   

#id no existe:
#[ "`grep x:$id /etc/passwd`" == "" ]


#usuario no coincide:
#linea_id="`grep x:$id /etc/passwd`"
#linea_id_con_espacios=$(echo $linea_id|sed 's/:/ /g')
#nombre_en_linea_id=`echo $linea_id_con_espacios | awk '{print $1}'`
#["$nombre_en_linea_id" != "$nombre" ]


#no existe ese usuario:
#linea_usuario="`grep $nombre:x: /etc/passwd`"
#[ "$linea_usuario" == "" ]


#~ cambiar usuario:
#~ linea_id="`grep x:$id /etc/passwd`"
#~ linea_id_con_espacios=$(echo$linea_id|sed 's/:/ /g')
#~ usuario_viejo=`echo $linea_id_con_espacios | awk '{print $1}'`
#~ path_viejo=`echo $linea_id_con_espacios | awk '{print $6}'`
#~ usermod -l $nombre $usuario_viejo
#~ mv $path_viejo /home/$nombre
#~ usermod -d /home/$nombre  $nombre


#~ cambiar grupo del usuario:
#~ linea_grupo="`grep $nombre:x /etc/group`"
#~ linea_grupo_con_espacios=$(echo $linea_grupo|sed 's/:/ /g')
#~ id_grupo=`echo $linea_grupo_con_espacios | awk '{print $3}'`
#~ linea_id="`grep x:$id /etc/passwd`"
#~ linea_id_con_espacios=$(echo$linea_id|sed 's/:/ /g')
#~ nombre_usuario=`echo $linea_id_con_espacios | awk '{print $1}'`
#~ usermod -g $id_grupo $nombre_usuario

#crear usuario con id correspondiente:
#adduser --uid $id $nombre

#~ grupo no coincide:
#~ linea_id="`grep x:$id /etc/passwd`"
#~ linea_id_con_espacios=$(echo$linea_id|sed 's/:/ /g')
#~ id_grupo_en_linea_id=`echo $linea_id_con_espacios | awk '{print $4}'`
#~ linea_id_grupo="`grep x:$id_grupo_en_linea_id /etc/group`"
#~ nombre_grupo=`echo $linea_id_con_espacios | awk '{print $1}'`
#~ [ $nombre_grupo != nombre]

#~ grupo existe:
#~ linea_grupo="`grep $nombre:x /etc/group`"
#~ [ $linea_grupo != "" ]

#~ crear grupo:
#~ addgroup $nombre 
if [ $# -lt 1 ]
then
echo Se debe suministrar el nombre de archivo de una lista con el siguiente formato:
echo id tipo usuario [grupo] clave
echo
echo Recuerde ejecutar como superusuario!! 
exit
fi
while read line ; do 
  id=`echo $line | awk '{print $1}'` 		
  tipo=`echo $line | awk '{print $2}'`
  nombre=`echo $line | awk '{print $3}'`
  grupo_input=`echo $line | awk '{print $4}'`
  numero_param=`echo $line | awk '{print NF}'`
  password=
  if [ $numero_param -le 4 ] # si hay un grupo entre los parametros
    then
    password=`echo $line | awk '{print $4}'`
    else
    password=`echo $line | awk '{print $5}'`
  fi
  
  if [ "`grep x:$id /etc/passwd`" = "" ] #id no existe:
    then
    if [ $tipo = "U" ] #tipo es U 
      then
      #no existe ese usuario:
      linea_usuario="`grep $nombre:x: /etc/passwd`"
      #[ "$linea_usuario" == "" ]
      if [ "$linea_usuario" == "" ] #no existe ese usuario
        then
        if [ numero_param -le 4 ] # si hay un grupo entre los parametros
          then
          #crear usuario con id correspondiente
          adduser --uid $id $nombre 
          else
          adduser --uid $id --group $grupo_input  $nombre 
        fi
        else
        echo "Ese id no existe pero el nombre de usuario ya esta ocupado."
      fi
      if [ $tipo = "G" ] #tipo es G 
        then
        echo Error: no existe el id $id y no se suministro un nombre de 
  usuario
        
      fi
    fi
    
    else #------> o sea que id si existe.
    #usuario no coincide:
    linea_id="`grep x:$id /etc/passwd`"
    linea_id_con_espacios=$(echo $linea_id|sed 's/:/ /g')
    nombre_en_linea_id=`echo $linea_id_con_espacios | awk '{print $1}'`
    #["$nombre_en_linea_id" != "$nombre" ]
    if [ $tipo = "U"  ] # tipo es U 
      then
      if [ "$nombre_en_linea_id" != "$nombre" ] # usuario no coincide
        then
        #no existe ese usuario:
        linea_usuario="`grep $nombre:x: /etc/passwd`"
        #[ "$linea_usuario" == "" ]
        if [ "$linea_usuario" == "" ] #no existe ese usuario
          then
          #~ cambiar usuario:
          linea_id="`grep x:$id /etc/passwd`"
          linea_id_con_espacios=$(echo $linea_id | sed 's/:/ /g')
          usuario_viejo=`echo $linea_id_con_espacios | awk '{print $1}'`
          path_viejo=`echo $linea_id_con_espacios | awk '{print $6}'`
          usermod -l $nombre $usuario_viejo
          mv $path_viejo /home/$nombre
          usermod -d /home/$nombre  $nombre
          else 
          echo "Error: no se puede cambiar el nombre de usuario porque ya existe otro usuario con ese nombre"
        fi
      fi
      linea_grupo="`grep $grupo_input:x /etc/group`"
      #[ $linea_grupo != "" ]      
      if [ "$linea_grupo" == "" ] # grupo no existe
        then
        #creo el grupo
        addgroup $grupo_input
      fi
      #~ cambiar grupo del usuario: 
      linea_id="`grep x:$id /etc/passwd`"
      linea_id_con_espacios=$(echo $linea_id | sed 's/:/ /g')
      nombre_usuario=`echo $linea_id_con_espacios | awk '{print $1}'`
      usermod -g $grupo_input $nombre_usuario
      
    fi
    #~ grupo no coincide:
    linea_id="`grep x:$id /etc/passwd`"
    linea_id_con_espacios=$(echo $linea_id | sed 's/:/ /g')
    id_grupo_en_linea_id=`echo $linea_id_con_espacios | awk '{print $4}'`
    linea_id_grupo="`grep x:$id_grupo_en_linea_id /etc/group`"
    linea_id_grupo_con_espacios=$(echo $linea_id_grupo | sed 's/:/ /g')
    nombre_grupo=`echo $linea_id_grupo_con_espacios | awk '{print $1}'`
    #[ $nombre_grupo != nombre ]
    if [ $tipo = "G" -a "$nombre_grupo" != "$nombre" ]  #tipo es G y grupo no coincide
      then
      #~ grupo existe:
      linea_grupo="`grep $nombre:x /etc/group`"
      #[ $linea_grupo != "" ]
      if [ "$linea_grupo" == "" ] #grupo no existe
        then
        #crear grupo
        addgroup $nombre 
      fi
    
      #~ cambiar grupo del usuario:
      linea_grupo="`grep $nombre:x /etc/group`"
      linea_grupo_con_espacios=$(echo $linea_grupo | sed 's/:/ /g')
      id_grupo=`echo $linea_grupo_con_espacios | awk '{print $3}'`
      linea_id="`grep x:$id /etc/passwd`"
      linea_id_con_espacios=$(echo $linea_id | sed 's/:/ /g')
      nombre_usuario=`echo $linea_id_con_espacios | awk '{print $1}'`
      usermod -g $id_grupo $nombre_usuario
    fi
  fi
  linea_id="`grep x:$id /etc/passwd`"
  linea_id_con_espacios=$(echo $linea_id | sed 's/:/ /g')
  nombre_final=`echo $linea_id_con_espacios | awk '{print $1}'`
  id_grupo_final=`echo $linea_id_con_espacios | awk '{print $4}'`
  path_final=`echo $linea_id_con_espacios | awk '{print $6}'`
  linea_grupo="`grep x:$id_grupo_final /etc/group`"
  linea_grupo_con_espacios=$(echo $linea_grupo | sed 's/:/ /g')
  grupo_final=`echo $linea_grupo_con_espacios | awk '{print $1}'`
  (sleep 4; echo $password; sleep 4; echo $password ) | sudo passwd $nombre_final 2> /dev/null
done < $1 
  chown $nombre_final:$grupo_final `find $path_final -user $nombre_final`




#reemplazar en x : por espacio :
#x=$(echo $x|sed 's/:/ /g')
