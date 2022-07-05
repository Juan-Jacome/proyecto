# README

1. Título del proyecto: Drinking Wingman

2. Descripción del proyecto:
    * La aplicación recomienda a los usuarios logeados una serie de cocteles en base a sus licores favoritos y su información física que es llenada a través de un formulario. Los cocteles recomendados serán en base a los datos registrados en la base de datos por un usuario administrador.

    * Se hizo uso de ruby on rails, ya que es un framework maduro que ofrece una gran estabilidad y solidez al proyecto, ademas permite que el mantenimiento del código no se complique con el tiempo. En resumidas cuentas es un framework sólido, rápido y escalable.

    * Para lograr deployar el proyecto de manera eficaz dentro de la plataforma “Heroku”, se tuvo que cambiar la base de datos de sqlite3 a postgresql, debido a que, la plataforma no soporta sqlite3.

3. Como usar el proyecto:
    * Registrarse: Para poder acceder a las funcionalidades del proyecto, se debe registrar un acuenta con un correo electrónico y una contraseña de al menos seis dígitos.

    * Login: Una vez registrado, logearse con las credenciales para poder hacer uso de las funcionalidades.

    * Agregar formulario: Una vez logeado, dirigirse a la pestaña de agregar formulario y llenar el formulario con la información personal solicitada, asegúrese de llenar todos los campos del formulario. Una vez enviado el formulario le enviara automáticamente a una nueva vista donde se le recomendara beber un número máximo de cocteles y se le mostrara los cocteles disponibles por cada uno de los licores favoritos. 

    * Formularios: En la pestaña formularios, se mostrara un alista con los diferentes formularios registrados por el usuario logeado, desde esta pestaña se podrá ver las recomendaciones de los formularios, editar un formulario o eliminar un formulario.

    * Ver todos los cocteles: En esta pestaña se muestra la lista de cocteles registrados por el usuario administrador, esta lista consta del nombre del coctel, los gramos de alcohol y el precio de cada uno de los diferentes cocteles.

    * Ver todos los licores: En esta pestaña se muestra la lista de licores registrados por el usuario administrador, esta lista consta del nombre del licor, la marca y  los grados de alcohol de cada uno de los diferentes licores.

4. Información adicional:

    * Ruby version: 3.0.0
    * Rails version: 6.1.5
    * Devise version: 4.8.1
    * Puma version: 5.0