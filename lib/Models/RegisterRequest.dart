class RegisterRequest {
  String name,email, password, id, mobileNo,Confirmpassword,address;

  RegisterRequest(
      {this.name,
      this.email,
      this.mobileNo,
      this.Confirmpassword,
      this.password,
      this.id,
        this.address
      });

  toMap() { 
    return {
      'id': this.id,
      'address': this.address,
      'name': this.name,
      'mobileNo': this.mobileNo,
      'password': this.password,
      'confirm': this.Confirmpassword,
      'email': this.email,
    };
  }

  RegisterRequest.fromMap(Map map) {
    this.id = map['id'];
    this.email = map['email'];
    this.Confirmpassword = map['confirm'];
    this.password = map['password'];
    this.mobileNo = map['mobileNo'];
    this.name = map['name'];
    this.address = map['address'];
  }
}
