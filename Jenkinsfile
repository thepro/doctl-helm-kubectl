pipeline {
    agent {
        kubernetes {
            label 'do-k8-agent-pod'
            yamlFile 'agent.yaml'
            defaultContainer 'docker'
      }
    }
    environment {
		dockerUser="thepro"
        dockerName="doctl-helm-kubectl"
        }
    stages {
        stage('Build docker') {
            steps {    
                script {
                    sh "docker login -u ${env.PUBLIC_DOCKER_REGISTRY_USERNAME} -p ${env.PUBLIC_DOCKER_REGISTRY_PASSWORD}"
			        def image = docker.build("${dockerUser}/${dockerName}:${env.BUILD_ID}")
                    image.push() 
                    image.push('latest')
                }
            }
        }
    }
     post {
        always {
           	sh "docker rmi \$(docker images -f 'dangling=true' -q --no-trunc) || true"
        }
    }
}


