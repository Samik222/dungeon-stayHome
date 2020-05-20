import ddf.minim.*;

Minim minim;
AudioPlayer coinSound;
AudioPlayer spiderSound;
AudioPlayer nextLevelSound;
AudioPlayer nextLevelDictorSound;
AudioPlayer diamondSound;
AudioPlayer gameOverSound;

void loadSounds() {
  minim = new Minim(this);
  coinSound = minim.loadFile("COIN.wav");
  spiderSound = minim.loadFile("SPIDER.mp3");
  nextLevelSound = minim.loadFile("NEXT-LEVEL.wav");
  nextLevelDictorSound = minim.loadFile("next-level-dictor.mp3");
  diamondSound = minim.loadFile("DIAMOND.mp3");
  gameOverSound = minim.loadFile("GAME-OVER.mp3");
}
