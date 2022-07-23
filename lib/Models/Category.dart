class Categories {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Categories(
      {this.idCategory,
        this.strCategory,
        this.strCategoryThumb,
        this.strCategoryDescription});

 factory  Categories.fromJson(Map<dynamic, dynamic> json) {
   return Categories(
       idCategory : json['idCategory'],
       strCategory : json['strCategory'],
       strCategoryThumb : json['strCategoryThumb'],
   strCategoryDescription : json['strCategoryDescription']
   );
  }

  Map<dynamic, dynamic> toJson() {
   return {
   'idCategory': this.idCategory,
   'strCategory' : this.strCategory,
   'strCategoryThumb' : this.strCategoryThumb,
   'strCategoryDescription': this.strCategoryDescription
  };
  }
}




