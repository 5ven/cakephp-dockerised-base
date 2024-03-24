# Setting Up for Local Development

## 1. Environment Configuration
Create a `.env` file in the project root directory and include the following lines, adjusting the passwords as necessary:

```
MYSQL_ROOT_PASSWORD=your_password
MYSQL_DATABASE=cakephp
MYSQL_USER=cakephp
MYSQL_PASSWORD=your_password
MYSQL_HOST=db
DEBUG=false
```

## 2. Install mkcert for Local SSL Certificates
- **macOS:**
  ```
  brew install mkcert
  brew install nss # For Firefox users
  ```
- **Linux:**
  ```
  sudo apt install libnss3-tools
  cd ~
  git clone https://github.com/FiloSottile/mkcert && cd mkcert
  go build -ldflags "-X main.Version=$(git describe --tags)"
  ```
- **Windows:**
  - Via Chocolatey:
    ```
    choco install mkcert
    ```
  - Further information: [mkcert on GitHub](https://github.com/FiloSottile/mkcert)

## 3. Common Step for All Platforms
Execute the following command to install mkcert on your machine:
```
mkcert -install
```
Generate the certificates only on the device you're working with.

## 4. Generate the Certificates
```
mkcert cakephp
```

## 5. Certificate Distribution
Transfer the generated certificates to your development Linux setup, placing them into the `config/local-certificates` directory. The nginx configuration currently assumes the following filenames:
```
cakephp-key.pem # Private key
cakephp.pem # Certificate
```

## 6. Edit the Hosts File
Update `/etc/hosts` on Linux/macOS or `C:\Windows\system32\drivers\etc\hosts` on Windows by adding the following entry:
```
<your server's IP address> cakephp
```
Example:
```
192.168.1.134 cakephp
```
This step enables the use of a local development domain in your browser.

## 7. CakePHP Setup
If CakePHP is not already set up, execute the script located at `helpers/setup.sh` to configure it.

## 8. Fix Access Rights
After cloning the CakePHP repository, navigate to the "helpers" directory and execute `fix-permissions.sh` to ensure file accessibility, allowing for editing in tools like VS Code.

## 9. Access the Front-end
Visit the front-end at:
[https://cakephp/](https://cakephp/)

## 10. Start Working
To start, update the .gitignore file by removing entries for directories you wish to track with Git. These often include directories such as app/{src, plugins, templates, tests, webroot, config}. Then, delete the .git directories (app/.git and ./git) and reinitialize Git from the project's root directory.