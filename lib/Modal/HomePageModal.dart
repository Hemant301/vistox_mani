class AppCatModal {
  String? title;

  String? id;
  AppCatModal({
    required this.title,
    required this.id,
  });
}

List<AppCatModal> appCatData = [
  AppCatModal(title: "overview", id: "1"),
  AppCatModal(title: "offer", id: "2"),
  AppCatModal(title: "menu", id: "3"),
  AppCatModal(title: "review", id: "4"),
];
