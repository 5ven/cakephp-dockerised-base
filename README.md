# Setting up for local development

## 1. Environment Configuration
Create a `.env` file under the project root directory and add the following lines into it (change the passwords accordingly):

```
MYSQL_ROOT_PASSWORD=the-pass
MYSQL_DATABASE=cakephp
MYSQL_USER=cakephp
MYSQL_PASSWORD=the-pass
MYSQL_HOST=db
DEBUG=false
```

## 2. Install mkcert for Local SSL Certificates
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
  - Use Chocolatey:
    ```
    choco install mkcert
    ```
  - See also: [mkcert on GitHub](https://github.com/FiloSottile/mkcert)

## 3. Common Step for All Platforms
```
mkcert -install
```
Only generate the certificates on the machine you plan to work on.

## 4. Generate the Certs
```
mkcert cakephp
```

## 5. Certificate Distribution
Copy the generated certificates over to the development Linux setup, into the `config/local-certificates` folder. Currently the following file names are assumed in nginx configuration:
```
cakephp-key.pem # the private key
cakephp.pem # the cert
```

## 6. Edit the Hosts File
Edit `/etc/hosts` on Linux/macOS or `C:\Windows\system32\drivers\etc\hosts` on Windows and add the following line:
```
<the ip address of your server> cakephp
```
Example:
```
192.168.1.134 cakephp
```
This allows you to use the local development domain in browsers.

## 7. CakePHP Setup
If you have not set up CakePHP yet, run the script at `scripts/setup.sh` to do that.

## 8. Fix Access Rights
After cloning the CakePHP code, cd into the "helpers" dir and run `fix-access-rights.sh` in order to be able to edit the files, for example, in VS Code.

## 9. Access the Front-end
Access the front-end at:
[https://cakephp/](https://cakephp/)
