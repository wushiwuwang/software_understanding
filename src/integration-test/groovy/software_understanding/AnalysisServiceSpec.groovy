package software_understanding

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class AnalysisServiceSpec extends Specification {

    AnalysisService analysisService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Analysis(...).save(flush: true, failOnError: true)
        //new Analysis(...).save(flush: true, failOnError: true)
        //Analysis analysis = new Analysis(...).save(flush: true, failOnError: true)
        //new Analysis(...).save(flush: true, failOnError: true)
        //new Analysis(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //analysis.id
    }

    void "test get"() {
        setupData()

        expect:
        analysisService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Analysis> analysisList = analysisService.list(max: 2, offset: 2)

        then:
        analysisList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        analysisService.count() == 5
    }

    void "test delete"() {
        Long analysisId = setupData()

        expect:
        analysisService.count() == 5

        when:
        analysisService.delete(analysisId)
        sessionFactory.currentSession.flush()

        then:
        analysisService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Analysis analysis = new Analysis()
        analysisService.save(analysis)

        then:
        analysis.id != null
    }
}
