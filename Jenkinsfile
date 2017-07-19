// ref https://jenkins.io/blog/2017/01/19/converting-conditional-to-pipeline/ 

registry_url = "https://index.docker.io/v1/"
build_tag = "testing" // default tag to push for to the registry

// TODO .. set up nessisary parameters, eg if evoked becuase of a new canidate Foo image, should have Foo build, branch, tag, etc
// TODO ... logic to set triggerIsGithub true or false
// TODO ... logic to set triggerIsFooBuild true or false
// TODO ... logic to set triggerIsBarBuild true or false

docker.withRegistry("${registry_url}") {
stages {
  stage('Create Image') { 
    when {
      expression {
        triggerIsGithub == true
      }
      node {
        step('Prepare') {
          git url: 'https://github.com/bharadwajal/docker.git'
        }

        step("Build") {
          echo "Nothing to compile/build/assemble ... this is just a placeholder"
        }
    
        step("Run unit tests") {
          echo "No unit tests to run, this is just a placeholder"
        }
  
        step("Docker-Build") {
          // Set up the container to build
          maintainer_name = "bj"
          container_name = "apache" 
          echo "Building docker.build(${maintainer_name}/${container_name}:${build_tag})"
          container = docker.build("${maintainer_name}/${container_name}:${build_tag}")
        }
      }
    }
  }
  
  // Run "Service Level tests" 
  //    ( an integration-like test with no external dependencies )
  stage("Service Level Tests") {
    when {
      expression {
        triggerIsGithub == true
      }
      node {

        // Run the container with the env file, mounted volumes and the ports:
        docker.image("${maintainer_name}/${container_name}:${build_tag}").withRun("--name=${container_name}")  { c ->
        sh "./test.sh"
             
        // At this point apache is running
        echo "Docker Container is running"      
      }
    
    // TODO stop containers
    }
  }
    
    
    // psuedocode for integration tests
    
    // this test uses the Foo container
    stage "Integration Test 1 - Foo test"
    when {
      expression {
         triggerWasFooBuild || triggerWasGithub 
      }
      steps {
        step {
          // TODO determine image ids based on logic and triggers for local image and Foo image
          // TODO Launch images
          // TODO Run int test
          // TODO Stop images
          echo "Nothing to do yet, but I'll do a lot in the future!"
        }
      }
    }
     // this test uses the Foo container
    stage "Integration Test 2 - Bar test"
    when {
      expression {
         triggerWasBarBuild || triggerWasGithub 
      }
      steps {
        step {
          // TODO determine image ids based on logic and triggers for local image and Foo image
          // TODO Launch images
          // TODO Run int test
          // TODO Stop images
          echo "Nothing to do yet, but I'll do a lot in the future!"
        }
      }
    }
  }
}
