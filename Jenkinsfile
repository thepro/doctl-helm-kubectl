pipeline {
    agent {
        kubernetes {
            label 'server-agent'
            yamlFile 'agent.yaml'
            defaultContainer 'docker'
      }
    }
    environment {
		dockerUser="thepro"
        dockerName="doctl-helm-kubectl"
        dockerRegistry="https://registry.hub.docker.com"
        }
    stages {
        stage('Build docker') {
            steps {    
                script {
                    docker.withRegistry("${dockerRegistry}", 'thepro_docker_registry_auth') {
			        def image = docker.build("${dockerUser}/${dockerName}:${env.BUILD_ID}")
                    image.push() 
                    image.push('latest')
                    }  
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


