def version
      pipeline
      {
      agent {
        label 'nodejs'
      }
        stages
        {
          stage('Create Image Builder') {
            steps {
              sh "oc new-build https://github.com/dwessendorf/slave-nodejs-with-newman.git --name=adp-jenkins-slave-nodejs-with-newman-latest --strategy=docker  --to=adp-jenkins-slave-nodejs-with-newman:latest"

            }
          }
          stage('Build Image') {

            steps {

              script {
                openshift.withCluster() {
                  openshift.withProject('adp-tools-ai-solutions-devops') {
                    openshift.selector("bc", "adp-jenkins-slave-nodejs-with-newman-latest").startBuild("--follow", "--wait=true")
                  }
                }
              }
            }
          }

        }
      }
