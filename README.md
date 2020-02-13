# Step ca init issue
This repo serves to demonstrate that the step cli command `step ca init` cannot be fully automated when using a preexisting encrypted key file. The cli ignores the --password-file command and will always prompt for a decryption password, which interferes with automation tools such as ansible.

## Usage
To demonstrate this issue perform the following steps:

1. Build the docker container
        
        docker build -t step-issue-example -f step-ca-init-issue.Dockerfile

2. Run the container

        docker run -it --rm step-issue-example

You should see output indicating what is happening and where the error occurs