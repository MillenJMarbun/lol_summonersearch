class LeaderboardInquiryParameter {
  String? url = "";
  String? region = "";

  String getUrl(String region) {
    region == "" ? "na1" : "";
    this.url =
        "https://${region}.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5?api_key=RGAPI-27c0e806-ee14-4909-bfeb-b7405d2c4e9e";
    return this.url!;
  }
}
