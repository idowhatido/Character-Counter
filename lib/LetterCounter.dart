class StringCount {
  String text;

  StringCount(String text) {
    this.text = text;
  }

  int LetterCounter() {
    return (text.length);
  }

  int WordCounter(){
    var spaces = ' '.allMatches(text).length;
    return(spaces);
  }
}
