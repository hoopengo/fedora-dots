import os

def prompt(q: str) -> bool:
  match input(f'{q} (Y/n): ').lower():
    case ["yes", "y", ""]:
      print('Начинаем исполнение.')
      return True
    case _:
      print('Пропускаем этот пункт.')
      return False

  return False

if prompt('Выполнить первичную установку?'):
  os.system('sh setup.sh')
  if prompt('Перезагрузить устройство? Это поможет в устанении многих ошибок'):
    os.system('sudo reboot')
else:
  os.system('sudo dnf update')

if prompt('Начать фиксить звук?'):
    os.system('sh alert-sound-fix.sh')
    os.system('sh sound-fix.sh')

if prompt('Пофиксить смену раскладки по ALT+SHIFT?'):
    os.system('sh keyboard-fix.sh')

if prompt('Установить драйвера NVIDIA? После, система сразу перезапустится'):
  os.system('sh nvidia.sh')
  
if prompt('Установить софт для игр?'):
  os.system('sh games.sh')

if prompt('Установить весь софт?'):
  os.system('sh soft.sh')
