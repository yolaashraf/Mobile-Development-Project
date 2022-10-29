class User {
  
  String Name = '';
  String password = '';
  String email = '' ;

  late int Mobile ;

  save() {
    //code to save to database or server
    print('saving user data');
    print('$Name $email $password $Mobile ');
   
  }
}