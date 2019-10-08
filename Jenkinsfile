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
              sh "oc new-build https://github.developer.allianz.io/ai-solutions/adp-toolchain-configuration.git --context-dir=/slave-nodejs-with-newman --name=adp-jenkins-slave-nodejs-with-newman-latest --strategy=docker --image-stream=adp-jenkins-slave-nodejs:latest --to=adp-jenkins-slave-nodejs-with-newman:latest"

            }
          }
          stage('Build Image') {

            steps {
              git branch: 'master', url: 'https://github.developer.allianz.io/ai-solutions/adp-toolchain-configuration.git', credentialsId: 'git-token-credentials'

              sh "rm -rf ocp && mkdir -p ocp/deployments"
              sh "pwd && ls -la target "
              //sh "cp target/reco-*.jar ocp/deployments"
              sh "cp Dockerfile ocp"
              //sh "cp run_reco.sh ocp"
              script {
                openshift.withCluster() {
                  openshift.withProject('adp-tools-ai-solutions-devops') {
                    openshift.selector("bc", "adp-jenkins-slave-nodejs-with-newman-latest").startBuild("--from-dir=./ocp/","--follow", "--wait=true")
                  }
                }
              }
            }
          }

        }
      }
