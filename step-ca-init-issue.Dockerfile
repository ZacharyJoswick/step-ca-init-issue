FROM smallstep/step-ca

USER root

# Create example password files
RUN mkdir -p /example_files && \
  echo "ProvisionerPassword" > /example_files/provisioner_password.txt && \
  echo "CaPassword" > /example_files/ca_password.txt


CMD ["bash", "-c", "chmod +x /example_files/example.sh ; /example_files/example.sh"]

WORKDIR /example_files

# Step requires ttl so we cant do the work in the container. 
# Copying in script which will perform the steps at runtime
ADD step_issue.sh /example_files/example.sh
