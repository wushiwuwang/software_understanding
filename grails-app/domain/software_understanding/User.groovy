package software_understanding

class User {
    String name
    String password
    String phone
    String emailAdd
    static constraints  = {
        name(size: 2..20,blank:false)
        password(size: 6..20,blank: false)
        phone(matches: /\d{7,11}/,blank: false)
        emailAdd(maxLength:200,blank: false,email: true,unique: true)
    }
 //  static hasMany = [Projects:Project]
}