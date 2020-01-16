class User{
  final String id;
  final String name;
  final String status;

  User(this.id, this.name, this.status);


  factory User.fromJson(Map json){

    var user = json['user'];

    return User(user['id'],
                user['name'],
                user['status']);
  }

  @override
  String toString() {
    return 'User: id=$id, name=$name, status=$status';
  }
}