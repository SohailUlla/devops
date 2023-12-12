pipeline {
    agent any 
    tools {
         maven 'maven'
         jdk 'java'
    }    
    stages {
 
       stage('Stage-0 : Static Code Analysis') { 
            steps {
              sh 'mvn verify sonar:sonar'
            }
        }

        stage('Stage-1 : Clean') { 
            steps {
                sh 'mvn clean'
            }
        }
         stage('Stage-2 : Validate') { 
            steps {
                sh 'mvn validate'
            }
        }
         stage('Stage-3 : Compile') { 
            steps {
                sh 'mvn compile'
            }
        }
         stage('Stage-4 : Test') { 
            steps {
                sh 'mvn test'
            }
        }
              stage('Stage-5 : Package') { 
            steps {
                sh 'mvn package'
                }
        }
          stage('Stage-6 : Verify') { 
            steps {
                sh 'mvn verify'
            }
        }
          stage('Stage-7 : Install') { 
            steps {
                sh 'mvn install'
            }
        }
           stage('Stage-8 : Deploy an Artifact to Artifactory Manager i.e. Nexus/Jfrog') { 
            steps {
                sh 'mvn deploy'
            }
           }

          stage('Stage-9 : Deployment - Deploy a Artifact cloudbinarydevops-3.6.0-SNAPSHOT.war file to Tomcat Server') { 
            steps {
                sh 'curl -u admin:redhat@123 -T target/**.war "http://107.21.147.94:8080/manager/text/deploy?path=/kesav&update=true"'
            }
        } 
          stage('Stage-10 : SmokeTest') { 
            steps {
                sh 'curl --retry-delay 10 --retry 5 "http://107.21.147.94:8080/kesav"'
            }
        }
    }
}
