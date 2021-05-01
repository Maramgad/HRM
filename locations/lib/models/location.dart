class Location {

  int id;
  String name;
  String theme;
  String description;
  String imageUrl;
  String locationUrl;
  Location({ this.id, this.name, this.theme, this.description, this.imageUrl, this.locationUrl}){
    assert(id!=null);
    assert(name!=null);
    assert(theme!=null);
    assert(description!=null);
    assert(imageUrl!=null);
    assert(locationUrl!=null);

  }

  get elementAt => null;



}