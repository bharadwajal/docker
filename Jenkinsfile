node {
registry_url = "https://index.docker.io/v1/"

build_tag = "testing" // default tag to push for to the registry

 stage 'Checking out GitHub Repo'
git url: 'https://github.com/bharadwajal/docker.git'

stage 'Building Container for Docker Hub'
 docker.withRegistry("${registry_url}") {

 // Set up the container to build
 maintainer_name = "bj"
 container_name = "apache"
 


 stage "Building"
echo "Building docker.build(${maintainer_name}/${container_name}:${build_tag})"
 container = docker.build("${maintainer_name}/${container_name}:${build_tag}")


 // Start Testing
stage "Running container"

 // Run the container with the env file, mounted volumes and the ports:
            docker.image("${maintainer_name}/${container_name}:${build_tag}").withRun("--name=${container_name}")  { c ->
                // wait for the apache server to be ready for testing
                // the 'waitUntil' block needs to return true to stop waiting
                // in the future this will be handy to specify waiting for a max interval:
                //

 sh "docker exec  -it  ${container_name} /bin/bash"
             sh "exit"




  // end of waitUntil

 // At this point apache is running
echo "Docker Container is running"
            
            }
 }
}
