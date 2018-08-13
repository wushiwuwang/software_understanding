package software_understanding

class Analysis {
    Project project
    String name //任务名
    int id   //分析任务id多对一项目
    static constraints = {
        id(blank: false)
        name(inList:["1","2","3","4"],blank:false)
    }
}
