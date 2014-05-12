CAPTasks
========

Primer trabajo práctico de Programación Web 3


Especificación Funcional 

 

1) Registración de usuario (Ceci) 

 

Al  ingresar a la aplicación,  un nuevo usuario podrá registrarse para comenzar a utilizarla. Una 

vez registrado, el usuario recibirá un email de activación que contendrá el link donde se activará 

su usuario registrado.. 

 

Los datos solicitados serán: 

 

● Nombre. Máximo de 20 caracteres. Obligatorio. 

● Apellido. Máximo de 20 caracteres. Obligatorio. 

● Email. Máximo de 20 caracteres. Obligatorio. 

● Contraseña. Máximo 20 caracteres. Obligatorio.  

○  Se deberá validar que el formato del dato ingresado sea un email. 

○ La contraseña al menos deberá contener 2 números y una letra mayúscula.  

○ Deberá existir otro campo donde el usuario deba volver a ingresar la contraseña 

para validar su correcta escritura. 

○ Ambos  campos  de  contraseña  no  deben  ser  visibles para el usuario  sino que 

deben enmascarar el valor correspondiente. 

● Captcha. El usuario deberá ingresar el valor correcto para poder registrarse. 

 

Validaciones: 

 

● En  caso de que ya exista un  usuario registrado activo  con el mismo email, se deberá 

validar y mostrar un mensaje amigable que indique que el email ya existe. 

● En  caso de que ya exista un usuario registrado inactivo con el mismo email, se deberá 

permitir la registración del usuario. Activando la registración ya existente y no duplicando 

la registración del mismo. Se deberá actualizar los datos Nombre, Apellido y Contraseña. 

 

 

El  link de activación tendrá un  tiempo  de expiración. Si dicho tiempo se excede. el usuario no 

podrá  utilizarlo  y  deberá  volver  a  registrarse.  para  recibir  un  nuevo  email  de  activación.  El 

período de activación es de 15 minutos desde la registración. 

 

Al  momento de activarse un usuario, se deberá crear una carpeta “General” que será utilizada 

por defecto en aquellas tareas que no se les asocie ninguna carpeta.  

 

2) Login de usuario (Ceci)

 

El usuario podrá ingresar a la aplicación con su email y contraseña definidos en la registración. 

Al ingresar en el top del sitio aparecerá un link/boton de logout que al clickearlo borrará los datos 

de sesión y redirigirá a la página de Login. 

 

Los datos solicitados serán: 

 

● Email. Máximo de 20 caracteres. Obligatorio. 

● Contraseña. Máximo 20 caracteres. Obligatorio.  

○  Se deberá validar que el formato del dato ingresado sea un email. 

○ El campo de contraseña no debe ser visible para el usuario sino que debe estar 

enmascarado. 

● (*3)  Recordarme.  Checkbox  que  al  hacer  login  y  estar  marcado,  creará  una  cookie 

(encriptada)  que  será  utilizada  para  que  en  un  futuro  no  sea  requerido  el  login 

nuevamente para ese usuario en ese navegador. 

 

Validaciones: 

 

● El  usuario  debe estar registrado en el  sistema. Caso  contrario, se deberá  mostrar un 

mensaje amigable “Verifique usuario y/o contraseña.”. 

● El  usuario debe estar  activo. Caso contrario,  se deberá mostrar un mensaje amigable 

“Usuario inactivo.”. 

● La contraseña debe  coincidir  con  la que está registrada el usuario. Caso contrario, se 

deberá mostrar un mensaje amigable “Verifique usuario y/o contraseña.”. 

 

3) Crear Carpeta (Agos)

 

Las carpetas se crearán para agrupar tareas. El uso de las mismas, al momento de crear una 

tarea es opcional. 

 

Los datos solicitados son: 

● Nombre. Máximo de 20 caracteres. Obligatorio. 

● Descripción. Máximo de 200 caracteres. Opcional. 

 

 

4) Crear Tarea (Agos)

 

Una vez logueado en la aplicación, el usuario podrá crear nuevas tareas dentro de la aplicación.  

 

Los datos solicitados serán: 

 

● Nombre. Máximo de 20 caracteres. Obligatorio. 

● Descripción. Máximo de 200 caracteres. Opcional. 

● Fecha  Fin.  Se  deberá  utilizar  un  control  de  ASP.NET  que  permita  utilizar  fechas. 

Opcional. 

● Prioridad.  Utilizar  un  control  de  ASP.NET  que  permita  listar  items.  Los  elementos 

posibles son: Alta, Media, Baja, Urgente. Opcional. 

● Carpeta.  Utilizar  un  control de ASP.NET que permita listar las carpetas. Las carpetas 

posibles se obtendrán dinámicamente. Opcional. 

● Completada. Esta  campo es un checkbox que no está marcado y esta deshabilitado (o 

solo lectura). 

 

Por defecto todas las tareas tendrán una prioridad Baja. 

Se permitirán crear tareas con igual nombre. 

En caso de que el usuario no haya creado carpetas o no haya seleccionado ninguna, las tareas 

se deberán asociar a una carpeta “General”. 

 

Validaciones: 

 


5) Listar Tareas (Pau)

 

El  usuario  al  ingresar  deberá  tener  un  listado  de  las  tareas  (ordenada  por  fecha 

descendentemente). 

(*3)  Deberá  existir  un  checkbox  que  diga  “incluir  completadas:”  que  por  defecto  esta 

desmarcado y un boton “Actualizar” que servirá como filtro de las tareas listadas. 

 

La grilla contendrá las siguientes columnas: 

1) Fecha 

2) Nombre 

3) Descripción 

4) Prioridad 

5) Carpeta  

6) Completada

7) (*3) Acción. debe poseer un boton que diga “Completar”, el mismo marca la tarea como 

Completada.
