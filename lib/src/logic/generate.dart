List generateList(int length) {
  var list = List<int>.generate(length, (i) => i+1);
  return list;
}

String mergeList(List list) {
  var stringList = list.join("");
  return stringList;
}

List splitString(String stringList) {
  var newList = stringList.split("");
  return(newList);
}

String searchElement(int length) {
  List firstList = generateList(length);
  String merge = mergeList(firstList);
  List lastList = splitString(merge);
  return(lastList[length-1]);
}