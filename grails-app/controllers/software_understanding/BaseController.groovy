package software_understanding
abstract class BaseController{
    def beforeInterceptor = [action: this.&auth, except: ['login']]
    private def auth() {
        if (!session.loginUser) {
            redirect(controller: 'user', action: 'login')
            return false
        }
    }
}