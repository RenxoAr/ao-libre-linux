![Logo](resources/ao-libre-linux-banner.png)

## Uso

### Requisitos

- Sistema Operativo Linux `Ubuntu` (20.04, 18.04 o 16.04) o `Manjaro`
- `curl` o `wget`
- `git`

### Instruccciones

#### con curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/RenxoAr/ao-libre-linux/master/install.sh)"
```

#### con wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/RenxoAr/ao-libre-linux/master/install.sh)"
```

#### Manual

```shell
git clone https://github.com/RenxoAr/ao-libre-linux.git ~/.ao-libre-linux
cd ~/.ao-libre-linux
sh ./install.sh
```

#### Ejecución post-instalación

Si se desea correr Argentum Online Libre en cualquier momento luego de la instalación puede hacerse de esta manera:

```shell
cd ~/.ao-libre-linux
sh ./run.sh
```

#### Actualización del cliente

El cliente va a actualizar automáticamente a la versión correspondiente al iniciar con el script run.sh

#### Inspección

Es aconsejable inspeccionar los scripts de fuentes que uno desconoce antes de ejecutarlos.
Pueden verificarlos de la siguiente manera:

```shell
curl -Ls https://raw.githubusercontent.com/RenxoAr/ao-libre-linux/master/install.sh | less
```

### Consideraciones

Los scripts van a instalar todas las dependencias, el launcher y el cliente de AO Libre.
Al preguntar por la instalación de Mono y Gecko aceptar (es necesario para ejecutar el cliente).
Una vez finalizada la instalación inicia el cliente.

Todo el contenido del repositorio que se descarga se encuentra en:

`~/.ao-libre-linux`

Para purgar la instalación (luego de desinstalar) de Argentum Online Libre:

`rm -rf ~/.wine/wineprefix/Argentum`

Launcher:

- Elegir idioma y continuar con la instalación
- Mantener la ruta por defecto de instalación del cliente
- Desmarcar *Ejecutar* y *Ver Leeme* al finalizar la instalación (no funciona)
  
### Aclaraciones

**Para distribuciones basadas en Debian:**
Si tira un error de SECUR32 prueben reinstalando el paquete winbind.

```shell
sudo apt install --reinstall winbind

o

sudo apt remove winbind; sudo apt install winbind
```

Si tienen que instalar o reinstalar alguna dependencia, por favor reinstalen wine de nuevo (tiende a fallar sino)

**Nota:**
Para testing en otras distribiciones, además las listadas en `dependencies.sh` (en su mayoría librerías 32bits), se tienen que tener en cuenta las siguientes dependencias:

- `winehq-stable`
- `wine-stable`
- `wine-stable-amd64`
- `wine-stable-i386`
- `gecko`
- `mono`

La configuración de WINE, la instalación del cliente y su configuración son distro-agnósticas.

### TODO

- [ ] Testear otras distros
- [ ] Testear VMs
- [ ] Testear LiveUSB
- [ ] Reemplazar repositorio de WINE por repositorios oficiales
- [ ] Generar Desktop File
- [ ] Reducir el User Input al mínimo posible
- [ ] Reducir las descargas de dependencias al mínimo posible
- [ ] Reducir la cantidad de dependencias al mínimo indispensable
- [ ] Generalizar dependencias
- [ ] Portear a distribuciones padre de las ya comprobadas (Arch Linux y Debian)
- [ ] Reemplazar winetricks por winecfg
- [ ] Generar output para interfaz amigable :slightly_smiling_face:

---
Dedicado a toda la comunidad de Argentum Online.
