import os

art = '''_       __        ___        __    ___    _     ________     ____   __   __
 )  ____) \    ___) (__    __) |  |   |  | |    \       |    \  (  (  )  ) 
(  (___    |  (__      |  |    |  |   |  | |     )      |     )  \  \/  /  
 \___  \   |   __)     |  |    |  |   |  | |  __/       |  __/    \    /   
 ____)  )  |  (___     |  |    |   \_/   | | |      __  | |        )  /    
(      (__/       )____|  |_____\       /__| |_____(  )_| |_______/  (_____
'''

print(art)

def prompt(q: str) -> bool:
	match input(f'{q} (Y/n): ').lower():
		case "yes" | "y" | "":
			print('Начинаем исполнение.')
			return True
		case _:
			print('Пропускаем этот пункт.')
			return False

	return False

if prompt('Выполнить первичную установку?'):
	os.system('sh scripts/setup.sh')
	if prompt('Перезагрузить устройство? Это поможет в устанении многих ошибок'):
		os.system('sudo reboot')
else:
	os.system('sudo dnf update')


if prompt('Начать фиксить звук?'):
		os.system('sh scripts/alert-sound-fix.sh')
		os.system('sh scripts/sound-fix.sh')

if prompt('Пофиксить смену раскладки по ALT+SHIFT?'):
		os.system('sh scripts/keyboard-fix.sh')

if prompt('Пофиксить скролл мыши? Он будет увеличен'):
  os.system('sh scripts/scroll-fix.sh')

if prompt('Установить драйвера NVIDIA? После, система сразу перезапустится'):
	os.system('sh scripts/nvidia.sh')
	
if prompt('Установить софт для игр?'):
	os.system('sh scripts/games.sh')

if prompt('Установить весь софт?'):
	os.system('sh scripts/soft.sh')