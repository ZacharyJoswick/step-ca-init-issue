#! /bin/bash 
echo -e "\n\E[0;44;1mRunning step init for the first time\E[0;0m\n"
step ca init --name="First Run" \
--password-file="/example_files/ca_password.txt" \
--dns="localhost,127.0.0.1" \
--address="0.0.0.0:443" \
--with-ca-url="localhost:443" \
--provisioner="Automated Provisioning" \
--provisioner-password-file="/example_files/provisioner_password.txt"

echo -e "\n\E[0;44;1mCopying files to examples folder\E[0;0m\n"
cp -v $STEPPATH/certs/root_ca.crt $STEPPATH/secrets/root_ca_key /example_files/

echo -e "\n\E[0;44;1mRemoving step directories\E[0;0m\n"
rm -rfv $STEPPATH/certs
rm -rfv $STEPPATH/config
rm -rfv $STEPPATH/secrets
rm -rfv $STEPPATH/templates

PASS=$(cat /example_files/ca_password.txt)

echo -e "\n\E[0;44;1mRunning step init the second time with exsiting key file.\E[0;0m\n"
echo -e "\n\E[0;45;1mThis will ask for a password even though the password file is provided\E[0;0m\n"
echo -e "\n\E[0;46;1mPassword is \"$PASS\"\E[0;0m\n"
step ca init --name="Second Run" \
--password-file="/example_files/ca_password.txt" \
--key="/example_files/root_ca_key" \
--root="/example_files/root_ca.crt" \
--dns="localhost,127.0.0.1" \
--address="0.0.0.0:443" \
--with-ca-url="localhost:443" \
--provisioner="Automated Provisioning" \
--provisioner-password-file="/example_files/provisioner_password.txt"

echo -e "\n\E[0;44;1mIf you manually enter the password it works as expected.\E[0;0m\n"