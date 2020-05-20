int currentLevelIndex = -1;
char[][] currentLevel;
int currentLevelWidth;
int currentLevelHeight;

void loadNextLevel() {
  if (currentLevelIndex >= LEVELS.length - 1) {
    state = VICTORY_STATE;
    return;
  }

  currentLevelIndex++;
  currentLevelWidth = LEVELS[currentLevelIndex][0].length;
  currentLevelHeight = LEVELS[currentLevelIndex].length;
  currentLevel = new char[currentLevelHeight][currentLevelWidth];

  for (int y = 0; y < currentLevelHeight; y++) {
    for (int x = 0; x < currentLevelWidth; x++) {
      char cell = LEVELS[currentLevelIndex][y][x];
      if (cell == 'P') {
        placePlayer(x, y);
      }
      currentLevel[y][x] = cell;
    }
  }
  recalcDrawingParams();
}

/*
 P.S
 'W' - Стена.
 ' ' - Проход.
 'P' - Игрок.
 'E' - Выход.
 'e' - Выход для тестов различных анимаций для побед, что-бы не проходить всю игру.
 'F' - Серкретнй проход в стене. "просто дырка"
 'S' - Паук(враг), если к нему приблизеться отнимет 3 очка.
 '*' - Монетка, собирая её, вы получаете 1 очко. (Очень частые)
 'K' - Ключь, для будущих дверей с ключом. "В разработке"
 'D' - Дверь, для того что-бы пройти через неё, нужен ключ. "В разработке"
 'd' - Алмаз, собирая их вы получаете 3 очка. (Редкие)
 */

void drawLevel() {
  for (int y = 0; y < currentLevelHeight; y++) {
    for (int x = 0; x < currentLevelWidth; x++) {
      int pixelX = x * cellSize + centeringShiftX;
      int pixelY = y * cellSize + centeringShiftY;
      char cell = currentLevel[y][x];
      switch (cell) {
      case 'W':
        image(wallImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case ' ':
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'P':
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'E':
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        image(stairsImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'e':        
        image(floorImage, pixelX, pixelY, cellSize, cellSize);        
        image(stairsImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case '*':
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);        
        coinSprite.draw(pixelX, pixelY, cellSize, cellSize);
        break;
      case 'F':
        image(fakeWallImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'S':
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);        
        spiderSprite.draw(pixelX, pixelY, cellSize, cellSize);
        break;
      case 'K': // TODO
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        image(Key, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'D': // TODO
        fill(200, 200, 200);
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        //image(door, pixelX, pixelY, cellSize, cellSize);
      case 'd':
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        diamondSprite.draw(pixelX, pixelY, cellSize, cellSize);
      }
    }
  }
}
