package software_understanding

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AnalysisController extends BaseController{

    AnalysisService analysisService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond analysisService.list(params), model:[analysisCount: analysisService.count()]
    }

    def show(Long id) {
        respond analysisService.get(id)
    }

    def create() {
        respond new Analysis(params)
    }

    def save(Analysis analysis) {
        if (analysis == null) {
            notFound()
            return
        }

        try {
            analysisService.save(analysis)
        } catch (ValidationException e) {
            respond analysis.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'analysis.label', default: 'Analysis'), analysis.id])
                redirect analysis
            }
            '*' { respond analysis, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond analysisService.get(id)
    }

    def update(Analysis analysis) {
        if (analysis == null) {
            notFound()
            return
        }

        try {
            analysisService.save(analysis)
        } catch (ValidationException e) {
            respond analysis.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'analysis.label', default: 'Analysis'), analysis.id])
                redirect analysis
            }
            '*'{ respond analysis, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        analysisService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysis.label', default: 'Analysis'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysis.label', default: 'Analysis'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def beforeInterceptor=[action: this.&auth]
    def search={
    }
    def doSearch() {
        if(!params.max ) params.max=2
        if(!params.offset) params.offset=0
        def serachClosure = {
            if (params.categoryName){
                category {
                    eq('categoryName', params.categoryName)
                }
            }
        }
        def c = Project.createCriteria()
        params.sort="project_name"
     //   params.order="asc"
        def projectList=c.list(params,serachClosure)
        def projectCount=projectList.totalCount
        println  "$projectCount"
        render(view:'index',model:[goodsInstanceList:projectList,goodsInstanceCount: projectCount] )  //如果不写goodsInstanceCount，需要执行第三步，否则第二步结束

        /*def c = Goods.createCriteria()
        def results = c.list{
        }
        redirect(view: 'index',model: [goodsInstanceList: results])*/
    }
}
