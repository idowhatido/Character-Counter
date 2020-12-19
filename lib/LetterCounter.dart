class StringCount {
  String text;

  static final int OUT = 0;
  static final int IN = 1;

  StringCount(String text) {
    this.text = text;
  }

  int characterCounter() {
    return (text.length);
  }

  int wordCounter() {
    var state = OUT;
    int wc = 0;
    int i = 0;

    while (i < text.length) {
      if (text[i] == ' ' || text[i] == '\n' || text[i] == '\t')
        state = OUT;
      else if (state == OUT) {
        state = IN;
        ++wc;
      }

      ++i;
    }
    return wc;
  }
}
