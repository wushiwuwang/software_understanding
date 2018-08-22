package software_understanding

class Analysis {
    Project project
    String startline
    String endline
    String column
    String group
    String code
    String message
    int id    //代码包id 一对一
    static constraints = {
        startline()
        endline()
        column()
        group()
        code()
        message()
        id(blank: false)
    }
}
