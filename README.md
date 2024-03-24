# Setting up for local development

1. Create a .env file under the project root dir and add similar lines into it (change the passwords):
MYSQL_ROOT_PASSWORD = the-pass
MYSQL_DATABASE = cakephp
MYSQL_USER = cakephp
MYSQL_PASSWORD = the-pass
MYSQL_HOST = db
DEBUG=false

2. **Install mkcert for Local SSL Certificates**
   - **macOS:**
     ```
     brew install mkcert
     brew install nss # if you use Firefox
     ```
   - **Linux:**
     ```
     sudo apt install libnss3-tools
     cd ~
     git clone https://github.com/FiloSottile/mkcert && cd mkcert
     go build -ldflags "-X main.Version=$(git describe --tags)"
     ```
   - **Windows:**
     - On Windows, use Chocolatey:
       ```
       choco install mkcert
       ```
     - See also: [https://github.com/FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
   - **Common:**
     ```
     mkcert -install
     ```
     Only generate the certificates on the machine you plan to work on.

3. **Generate the Certs**
    ```
    mkcert cakephp
    ```
4. **Certificate Distribution**
- Copy the generated certificates over to the development Linux setup, into the `config/local-certificates` folder. Currently following file names are assumed:
  ```
  cakephp-key.pem # the private key
  cakephp.pem # the cert
  ```

5. **Edit Hosts File**
- Edit `/etc/hosts` on Linux/macOS or `C:\Windows\system32\drivers\etc\hosts` and add the following pairs:
  ```
  <the ip address of your server> cakephp

  like this:

  192.168.1.134 cakephp
  ```
  This allows you to use the local development domains in browsers.

6. If you have not set up CakePHP yet, use the script at scripts/setup.sh to do that

7. After cloning the CakePHP code, cd into the "helpers" dir and run fix-access-rights.sh in order to be able to edit the files for example in VS Code.

8. Access the front-end at:
[https://cakephp/](https://cakephp/)
