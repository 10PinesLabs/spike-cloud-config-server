timestamps {
  currentBuild.result = "SUCCESS"

  def projectName = "spike-config-server"

  properties([
    parameters([
      booleanParam(name: 'MAKE_RELEASE', defaultValue: false, description: 'Crear un release y subir a Artifactory')
    ]),
    pipelineTriggers([
      pollSCM('@daily')
    ])
  ])

  node {
    try {
      lock(resource: "${projectName}-${env.BRANCH_NAME}-build", inversePrecedence: true) {
          stage('Checkout') {
            deleteDir()
            checkout scm
          }

          stage('Build') {
            milestone()

            pom = readMavenPom file: 'pom.xml'
            def warVersion = pom.version
            if (params.MAKE_RELEASE) {
                warVersion = warVersion.minus("-SNAPSHOT")
            }
            currentBuild.displayName = "#${env.BUILD_NUMBER} - ${warVersion}"
            sh 'mvn clean package -P vates'
          }

          if (params.MAKE_RELEASE) {
            stage('Artifactory') {
              lock(resource: "${projectName}-artifactory", inversePrecedence: true) {
                if (params.MAKE_RELEASE) {
                    sh 'mvn release:clean release:prepare release:perform -B'
                } else {
                    sh 'mvn deploy -Dmaven.main.skip -Dmaven.test.skip'
                }
              }
            }
          }
      }
    } catch (err) {
      currentBuild.result = "FAILURE"
      throw err
    }
  }
}
