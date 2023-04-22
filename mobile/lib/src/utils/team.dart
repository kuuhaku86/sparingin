class Team {
  final String image;
  final String icon;
  final String name;
  final String slogan;
  final String status;
  final bool full;
  List<String> teamPlayer;
  Team(
    this.image, 
    this.icon, 
    this.name, 
    this.slogan, 
    this.status, 
    this.full,
    this.teamPlayer);
}

List <Team> listTeam = [
  new Team(
    'assets/images/card/chelseaFutsal.jpg',
    'assets/images/card/chelsea.png', 
    "Chelsea FC", 
    "KTBBF", 
    "Sedang mencari lawan",
    true,
    []
  ),
  new Team(
    'assets/images/card/liverpoolFutsal.jpg', 
    'assets/images/card/liverpool.png', 
    "Liverpool FC", 
    "You'll Never Walk Alone", 
    "Sedang bertanding",
    true,
    []
  ),
  new Team(
    'assets/images/card/totenhamFutsal.jpg', 
    'assets/images/card/totenham.png', 
    "Totenham Hotspur", 
    "The Lily Whites", 
    "Sedang mencari lawan",
    true,
    []
  ),
  new Team(
    'assets/images/card/juaraFutsal.jpg', 
    'assets/images/card/krustykrab.png', 
    "Juara Team", 
    "Yang Penting Menang", 
    "Sedang mencari kawan",
    false,
    [
      "Anto",
      "Parto",
      "Andy",
    ]
  ),
  new Team(
    'assets/images/card/canadianFutsal.jpg', 
    'assets/images/card/canadian.png', 
    "Canadian Team", 
    "Yuk Bersenang-senang", 
    "Sedang mencari kawan",
    false,
    [
      "Andri",
      "Jack",
      "Brood",
    ]
  ),
  new Team(
    'assets/images/card/phuketUnitedFutsal.jpg', 
    'assets/images/card/phuketUnited.png', 
    "Phuket Team", 
    "Yuk Main", 
    "Sedang mencari kawan",
    false,
    [
      "Andre",
      "Pilo",
      "Kiki",
    ]
  ),
];
