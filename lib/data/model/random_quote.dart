class RandomQuote {
  String? sId;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;

  RandomQuote(
      {this.sId,
        this.author,
        this.content,
        this.tags,
        this.authorSlug,});

  RandomQuote.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author = json['author'];
    content = json['content'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['author'] = this.author;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['authorSlug'] = this.authorSlug;
    return data;
  }
}
