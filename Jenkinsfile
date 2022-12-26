node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
       sh 'pwd'
       sh 'ls'
       app = docker.build("infinityofcore/test")
    }



    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
    
    stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
}
