# Level Devil - Godot 4 Troll Platformer

## Структура проекта
```
level_devil/
├── project.godot          # Настройки проекта
├── scenes/
│   ├── MainMenu.tscn      # Главное меню
│   ├── Player.tscn        # Персонаж
│   ├── TouchControls.tscn # Мобильные кнопки
│   ├── WinScreen.tscn     # Экран победы
│   └── levels/
│       ├── Level01.tscn   # Уровни 1-12
│       └── ...
├── scripts/
│   ├── GameManager.gd     # Автозагрузка - управление уровнями
│   ├── Player.gd          # Движение игрока
│   ├── BaseLevel.gd       # Базовый скрипт уровня
│   ├── DisappearingFloor.gd
│   ├── SpikeTrap.gd
│   ├── MovingPlatform.gd
│   ├── FakeWall.gd
│   ├── GravityFlipper.gd
│   ├── TouchControls.gd
│   ├── MainMenu.gd
│   └── WinScreen.gd
└── .github/workflows/
    └── build-android.yml  # GitHub Actions сборка APK
```

## Настройка в Godot 4

1. Открой Godot 4 → "Import" → выбери папку проекта
2. Добавь GameManager как Autoload:
   - Project → Project Settings → Autoload
   - Добавь `res://scripts/GameManager.gd` с именем `GameManager`

## GitHub Actions - Получение APK

После пуша в main/master:
1. Иди в Actions на GitHub
2. Жди окончания билда (~5-10 мин)
3. Скачай APK из Artifacts или Releases

## Ловушки в игре

| Скрипт | Описание |
|--------|----------|
| `DisappearingFloor.gd` | Пол исчезает под ногами |
| `SpikeTrap.gd` | Шипы появляются когда подходишь |
| `MovingPlatform.gd` | Платформа разворачивается и ускоряется |
| `FakeWall.gd` | Стена пропадает в последний момент |
| `GravityFlipper.gd` | Переворачивает гравитацию |

## Добавление новых уровней

1. Создай новую сцену на основе `BaseLevel.gd`
2. Добавь `PlayerSpawn` (Marker2D)
3. Добавь `Goal` (Area2D) 
4. Расставь ловушки из scripts/
5. Добавь путь в `GameManager.gd` → массив `LEVELS`
