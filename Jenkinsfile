pipeline {
    agent any
    
    tools {
      nodejs 'node17'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
        DOCKER_IMAGE = 'nginxstore/webapp-example-2:latest'
        DOCKER_CONTAINER_NAME = 'webapp2'
        DOCKERFILE_PATH = './Dockerfile'
        DIST_DIR = '/var/jenkins_home/workspace/webapp2-pipeline/example-web-2/dist'
        NGINX_PATH = '/usr/share/nginx/'
    }

    stages {
        stage('Checkout') {
            steps {
                // GitHub에서 소스코드를 체크아웃합니다.
                git branch: 'main', url: 'https://github.com/DevBinx/example-web-2.git'
            }
        }

        stage('Vue Build') {
            steps {
                // Vue.js 프로젝트를 빌드합니다.
                dir('example-web-2') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    // Docker Hub에 로그인
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    // Docker 컨테이너를 빌드하고 실행합니다.
                    sh """
                    # 기존 컨테이너 정지 및 삭제
                    docker rm -f ${DOCKER_CONTAINER_NAME} || true
                    
                    # 새로운 컨테이너 실행
                    docker run -d -p 8012:80 --name ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE}

                    # dist 폴더를 컨테이너 내 NGINX 경로로 복사
                    docker cp ${DIST_DIR} ${DOCKER_CONTAINER_NAME}:${NGINX_PATH}
                    """
                }
            }
        }
        
        stage('Docker Deploy') {
            steps {
                script {
                    // 새로운 이미지를 커밋하고 Docker Hub로 푸시
                    sh """
                    docker commit ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE}
                    docker push ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Clean Up') { 
            steps { 
                // 사용한 도커 이미지를 제거합니다.
                sh "docker rmi ${DOCKER_IMAGE}"
            }
        }
    }
}