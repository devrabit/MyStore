# Prueba Técnica en Swift para Mercado Libre

## Descripción
My Store consta de tres pantallas: una de Búsqueda, una de Resultados y una de Descripción de Producto. La aplicación se conecta al API de Mercado Libre (developers.mercadolibre.com.ar/es_ar/items-y-busquedas) para obtener los datos necesarios.

### Tareas:
- Implementar la pantalla de Búsqueda, que permita al usuario ingresar términos de búsqueda.
- Mostrar los resultados de búsqueda en la pantalla correspondiente.
- Permitir al usuario ver la descripción completa de un producto seleccionado.

## Requisitos
- Xcode versión >= 14.3.1.

## Instrucciones
1. Clona este repositorio.
2. Abre el proyecto (MyStore.xcodeproj) en Xcode versión >= 14.3.1.
3. Asegúrate de tener una conexión a internet activa.
4. Ejecuta la aplicación en un simulador o dispositivo.
5. Prueba la funcionalidad de búsqueda, visualización de resultados y descripción de productos.
6. Verifica que la aplicación se comporte como se espera.

## Estructura del proyecto
- `mystore/`: Carpeta que contiene el proyecto de Xcode.
  - `mystore/Domain`: Contiene la lógica de dominio pura, desacoplada de los detalles de la implementación.
  - `mystore/Presentation`: Contiene la lógica específica de la aplicación.
    - `mystore/Presentation/Modules`: Contiene todos los módulos y sus flujos.
    - `mystore/Presentation/Commons`: Contiene las clases con lógica compartida.
  - `mystore/Infraestructure`: Contiene la capa encargada de la comunicación con los Web services.
  - `Assets/`: Carpeta con los recursos gráficos.

## Gracias por revisar mi prueba :)
Si tienes alguna pregunta o necesitas aclaraciones, no dudes en contactarme a través de [correo electrónico o plataforma de mensajería].
