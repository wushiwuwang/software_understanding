package software_understanding

import grails.gorm.services.Service

@Service(Analysis)
interface AnalysisService {

    Analysis get(Serializable id)

    List<Analysis> list(Map args)

    Long count()

    void delete(Serializable id)

    Analysis save(Analysis analysis)

}