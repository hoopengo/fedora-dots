import os

art = '''_       __        ___        __    ___    _     ________     ____   __   __
 )  ____) \    ___) (__    __) |  |   |  | |    \       |    \  (  (  )  ) 
(  (___    |  (__      |  |    |  |   |  | |     )      |     )  \  \/  /  
 \___  \   |   __)     |  |    |  |   |  | |  __/       |  __/    \    /   
 ____)  )  |  (___     |  |    |   \_/   | | |      __  | |        )  /    
(      (__/       )____|  |_____\       /__| |_____(  )_| |_______/  (_____
'''

print(art)

os.system('sudo dnf update')

def prompt(q: str) -> bool:
	match input(f'{q} (Y/n): ').lower():
		case "yes" | "y" | "":
			print('Начинаем исполнение.')
			return True
		case _:
			print('Пропускаем этот пункт.')
			return False

setup = {
	'Начать фиксить звук?': ['sh scripts/alert-sound-fix.sh', 'sh scripts/sound-fix.sh'],
	'Пофиксить смену раскладки по ALT+SHIFT?': ['sh scripts/keyboard-fix.sh'],
	'Пофиксить скролл мыши? Он будет увеличен': ['sh scripts/scroll-fix.sh'],
	'Установить драйвера NVIDIA? После, система сразу перезапустится': ['sh scripts/nvidia.sh'],
	'Установить софт для игр?': ['sh scripts/games.sh'],
	'Установить весь софт?': ['sh scripts/soft.sh']
}

if prompt('Выполнить первичную установку?'):
	os.system('sh scripts/setup.sh')
	if prompt('Перезагрузить устройство? Это поможет в устанении многих проблем'):
		os.system('sudo reboot')

for key in setup:
	vals = setup.get(key)

	if prompt(key):
		for val in vals:
			os.system(val)