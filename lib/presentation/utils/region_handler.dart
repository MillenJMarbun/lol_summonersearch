String convertshortToLongRegion(String shortRegion) {
  String LongRegion;
  switch (shortRegion) {
    case "na1":
      LongRegion = "americas";
      break;
    case "sg2":
      LongRegion = "sea";
      break;
    case "oc1":
      LongRegion = "asia";
      break;
    case "kr":
      LongRegion = "asia";
      break;
    default:
      LongRegion = "Invalid Month";
      break;
  }
  return LongRegion;
}
