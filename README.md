# FEDORA36 STARTING UP

> Перед началом этого гайда хотел бы сказать, что я делал его под себя (py программиста) и вам он может не подходить. Не стоит следовать каждому пункту и устанавливать тот софт который вам не нужен.

**Источники:**
<details>

<!-- start -->
 1. [Fedora Linux 36 | ДЕТАЛЬНАЯ НАСТРОЙКА С НУЛЯ (2022) | Fedora Zero](https://vk.com/@plafonvk-fedorazero)
 2. [Fedora Zero](https://vk.com/@plafonvk-fedorazero)
 3. [Линукс софт на каждый день](https://youtu.be/SDhg_UF0NCI)
 4. [КАК НАЧАТЬ ИГРАТЬ НА ЛИНУКСЕ](https://youtu.be/Y53Ox2tmsLU)
 5. [DaVinci Resolve 17 на Fedora Linux 35](https://youtu.be/39_wWFBcP2E)
 6. [gamer station [on linux]](https://www.youtube.com/c/UbuntariumbyRedroot)
 7. [LINUX GAMING для новичков](https://youtu.be/BlbPb3QVjR8)
 8. [nstalling & Customizing The Fish Shell](https://youtu.be/wpinXVpL5-U)
 9. [My Fish shell workflow for coding](https://youtu.be/KKxhf50FIPI)
 10. [Creating Functions In The Fish Shell](https://youtu.be/ec1A3YGQY60)
<!-- end -->
  
</details>

## Создание загрузочной флешки

1. Установливаем [Ventoy](https://github.com/ventoy/Ventoy/releases) или Fedora Media Writer. На крайняк [Rufus](https://rufus.ie/)
2. Запустите Ventoy и [создайте мультизагрузочную флешку](https://youtu.be/88RS7H0p8kQ) или загрузите образ через другие программы.
3. Скачайте [Fedora](https://getfedora.org/ru/workstation/download/) или [Nobara](https://nobaraproject.org/) (многое пофикшено, но я свовил достаточно багов чтобы отказаться от этого решения. Добавлю также, что некоторые пункты из этого гайда выполнять на Nobara не нужно! К примеру `nvidia.sh` и `games.sh`)

## Установка Fedora36

Если у вас есть пункт `Выбор программ`, тогда выбираем там Fedora Workstation и нажимаем готово. 

<img src="sources/progs-label.png" />

Если есть пункт `Имя сети и узла`, и он горит ошибкой, то выбираем там ваш wifi-адаптер и подключаемся к сети.

<img src="sources/wifi.png" />

Тут создаем root пользователя и своего личного. Ну или же можно дать root права вашему пользователю, для этого пропустите пункт `Учётная запись root` и убедитесь что стоит галочка на Выдать wheel права в пункте `Создание пользователя`

<img src="sources/usr.png" />

Если есть пункт `Источник установки`, выбираем ближайшее зеркало и нажимаем готово

<img src="sources/sources.png" />

## Разметка диска
[Видео](https://vk.com/video-211011902_456239066)

Я решил вынести это в отдельный пункт, потому-что это самое важно.
1. Для начала выбираем те диски, которые вы хотите использовать.

<img src="sources/disks.png" />

2. Потом в способе разметки выбираем `Blivet-GUI`

<img src="sources/blivet-gui.png" />

3. Удаляем все разделы с дисков.
4. Создаём `efi` раздел. В файловой системе выбираем `Efi partition manager`

<img src="sources/boot-efi.png" />

5. Создаём `boot` раздел

<img src="sources/boot.png" />

6. Создаём `swap` на 8 гб (если не жалко) или на 5 гб (если жалко)

<img src="sources/swap.png" />

7. Для остального пространства размечаем btrfs без точки монтирования

<img src="sources/btrfs.png" />

8. Создаём субвалюмы в правильной последовательность

<img src="sources/log.png" />

<img src="sources/home.png" />

<img src="sources/dir.png" />

9. Проверяем их правильность.

<img src="sources/all-btrfs.png" />

10. Если есть ещё диски, размечаем их `ext4` и в точке монтирования пишем `/mnt/{ваше_имя}`, для примера у меня стоит `/mnt/disk1`

## Настройка `fstab`
Тут нужно быть осторожнее. 
Для начала делаем копию нашего fstab на всякий случай. `cp /etc/fstab ~/fstab-copy`
Дальше нужно вставить строчку в наши субвалюмы `,defaults,noatime,discard=async`, после чего сохранить файл и прописать sudo reboot.

<img src="sources/fstab.jpg" />

Если система не запускается или входит в "безопасный режим", то:
1. Выключаем компьютер
2. При запуске зажимаем SHIFT
3. Выбираем fedora из списка и нажимаем `e`
4. В конце дописываем `single init=/bin/bash`
5. Также заменяем `ro` на `rw`
6. У вас могут не работать консольные команды, поэтому пишем `sudo su`, `/usr/bin/nano ~/fstab-copy`, копируем всё содержимое. `/usr/bin/nano /etc/fstab`, заменяем содержимое на то что скопировали.
7. Сохраняем файл и пишем `sudo reboot -f -f`
8. Система перезапуститься и должна начать работать.

## Первичная настройка
Заходим в Установщик программ, он будет закреплён на вашем доке, и включаем сторонние репозитории.

Заходим в консоль и пишем `sudo dnf update`, после `sudo reboot`, дальше система перезапуститься.

Дальше копируем этот репозиторий `git clone https://github.com/hoopengo/fedora-startup.git` и устанавливаем python `sudo dnf install python`, проверяем версию `python -V`, должна быть **3.10^**.

Запускаем скрипт `python setup.py` и начинаем начальную установку, вы сами можете зайти в файл (`scripts/setup.sh`) и отредактировать его, удалив или добавив что-то. После установки, вам будет предложено перезагрузить систему и дабы не возникало ошибок, лучше это сделать.

После перезапуска снова запускаем скрипт и отказываемся от первичной установки. 

## Дальше идут фиксы:
1. Фикс звука - убирает назойливый bell. Убирает ограничение в 100% макс.звука и устанавливает шаг громкости *2*
2. Фикс смены раскладки - заменяем super+space на alt+shift (что сделать вручную почему-то нельзя). Также лучше зайти в gnome-tweaks и выключить там смену раскладки по alt+shift
3. Фикс скролла мыши - увеличит скролл мыши до 2, это можно изменить в `scripts/scroll-fix.sh`

## Nvidia
После вам предложат установить nvidia драйвера. Если у вас не nvidia, то пропустите этот пункт, после установки система сразу перезапустится.

## Игры
Установка игровых штук. Среди которых:
1. steam
2. heroic launcher (epic games)
3. protonUP-QT

Запустите steam и залогиньтесь. Дальше зайдите в ProtonUP-Qt и скачайте последнюю версию proton-ge (Дальше она появиться в compatibility в свойствах игры в стиме. Вы должны будете выбрать её). Также вы сможете запускать пиратские игры через lutris.

- Если вы изменили местоположение библиотеки стим, чтобы он запускал игры добавьте путь до неё в flatseal. Для примера `~/games` или `/mnt/disk1/games` 

<img src="sources/flatseal-steamfix.jpg" />

## Софт
Самое долгое из всего. Установка ВСЕГО софта.

Flatpak:
1. ExtensionManager
2. VideoDownloader
3. OBS
4. Fragments
5. Collision
6. handbrake
7. MetadataCleaner
8. GPUViewer
9. mpv
10. dejadup (Backups)
11. krita
12. telegram
13. onlyoffice
14. discord
15. chrome

Snap:
1. vscode
2. pycharm community.ed

## Батарея
Заходим в настройки батареи и выключаем всё что вас должно тревожить

<img src="sources/battery-settings.png" />
