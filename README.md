# VIPER-Test

![name](https://github.com/ricardo-granja-chavez/VIPER-Test/blob/master/viper-diagram.png?raw=true)

## ¿Qué es la arquitectura VIPER?
VIPER es un acrónimo de Vista, Interactor, Presentador, Entidad y Enrutador.

Esta arquitectura se basa en el principio de responsabilidad única que conduce a una arquitectura limpia.
### Vista
La responsabilidad de la vista es enviar las acciones del usuario al presentador y mostrar lo que el presentador le diga.
### Interactor
Esta es la columna vertebral de una aplicación ya que contiene la lógica de negocios.
### Presentador
Su responsabilidad es obtener los datos del interactor sobre las acciones del usuario y después de obtener los datos del interactor, los envía a la vista para mostrarlos. También le pide navegación al enrutador/estructura alámbrica.
### Entidad
Contiene objetos de modelo básicos utilizados por el interactor.
### Enrutador
Tiene toda la lógica de navegación para describir qué pantallas se mostrarán y cuándo. Normalmente se escribe como una estructura alámbrica.

