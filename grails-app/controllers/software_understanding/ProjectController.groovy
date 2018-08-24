package software_understanding

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProjectController extends BaseController{

    ProjectService projectService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond projectService.list(params), model:[projectCount: projectService.count()]
        }


    def show(Long id) {
        respond projectService.get(id)
    }

    def create() {
        respond new Project(params)
    }

    def save(Project project) {
        if (project == null) {
            notFound()
            return
        }

        try {
            projectService.save(project)
        } catch (ValidationException e) {
            respond project.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*' { respond project, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond projectService.get(id)
    }

    def update(Project project) {
        if (project == null) {
            notFound()
            return
        }

        try {
            projectService.save(project)
        } catch (ValidationException e) {
            respond project.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*'{ respond project, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        projectService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def beforeInterceptor=[action: this.&auth]
    def submit = {
        //    ssh 192.168.17.129 "/bin/bash /home/fcd/桌面/SWAMP1/run.sh"
        def cmdstring = "expect /home/ubuntu/IdeaProjects/untitled/test.sh httpd-2.4.6.tar.bz2"
        def proc = Runtime.getRuntime().exec(cmdstring)
        proc.waitFor()
    }
    def result = {
        //    ssh 192.168.17.129 "/bin/bash /home/fcd/桌面/SWAMP1/run.sh"
        def cmdstring = "expect /home/ubuntu/IdeaProjects/untitled/result.sh httpd-2.4.6.tar.bz2"
        def proc = Runtime.getRuntime().exec(cmdstring)
        proc.waitFor()
    }
}
