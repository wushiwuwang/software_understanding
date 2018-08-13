package software_understanding

class Project {
    User  user      //创建人一对多项目
    String project_name  //项目名
    Date time  //时间
    String language   //项目语言
    int project_id    //代码包id 一对一
    static constraints = {
        project_name(blank: false)
        time()
        language(inList:["C","C++","java","python","php","Binary"],blank:false)
        project_id(blank: false)
    }
     //static belongsTo = [User]
   //static hasMany = [Analysis: Analysis]
}
