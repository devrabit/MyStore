# Prueba Técnica en Swift para Mercado Libre

## Descripción
My Store consta de tres pantallas una de Busqueda, una de resultados y una de descripción de producto. Esta va conectada a el api de Mercadop libre  (developers.mercadolibre.com.ar/es_ar/items-y-busquedas) 

## Requisitos
- Xcode version >= 14.3.1.

## Instrucciones
1. Clona este repositorio.
2. Abre el proyecto (MyStore.xcodeproj) en Xcode version >= 14.3.1
4. Darle play al proyecto.

## Estructura del proyecto
- `mystore/`: Carpeta que contiene el proyecto de Xcode.
- `mystore/Domain`: : En esta carpeta está la capa contiene la lógica de dominio pura, desacoplada de los detalles de la implementación ().
  - `mystore/Presentation`:  Capa contiene la lógica de aplicación específica.
    - `mystore/Presentation/Modules`: Contiene todos los modulos y sus flujos
    -  `mystore/Presentation/Commons`: Contiene las clases con logica compartida
  - `mystore/Infraestructure`: En esta carpeta esta la capa encargade de la comunicacion con los Web services.
  - `Assets/`: Carpeta con los recursos gráficos.

## Gracias por revisar mi prueba :)
