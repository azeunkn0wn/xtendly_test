# xtendly_test

[![Codemagic build status](https://api.codemagic.io/apps/64297cc8bd97d1d71cc6f909/64297cc8bd97d1d71cc6f908/status_badge.svg)](https://codemagic.io/apps/64297cc8bd97d1d71cc6f909/64297cc8bd97d1d71cc6f908/latest_build)

[Figma Design Here](https://www.figma.com/file/oFhx3T6kPyaHgZZOJMLs9s/Untitled?t=DziXhgdx66k4mAbW-0)

[Flutter web app demo](https://xtendly_test.codemagic.app/) 


## Cloning the Repo

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Type the following command:

    ```shell
    git clone https://github.com/azeunkn0wn/xtendly_test.git
    ```

4. Press Enter.

## Running the App

1. Open your terminal or command prompt.
2. Navigate to the project directory.
3. Type the following command:

    ```shell
    flutter run -d chrome --release -v  --web-renderer canvaskit
    ```

This command will start the web server and launch the app in Google Chrome.

Note: Make sure that you have Google Chrome installed on your computer. If you prefer to use a different web browser, replace `chrome` in the above command with the name of your preferred browser.

## Running the Web Server

1. Open your terminal or command prompt.
2. Navigate to the project directory.
3. Type the following command:

    ```shell
    flutter run -d web-server --web-hostname 0.0.0.0 --web-port 5000 --release -v  --web-renderer canvaskit
    ```

4. Open your browser and navigate to `http://localhost:5000`. To view the web app in mobile browser, navigate to `http://<your-ip-address>:5000` where `<your-ip-address>` is the IP address of your computer.

This command will host the web app on your local machine. To host the web app on a server, you can use the `--web-hostname` and `--web-port` flags to specify the hostname and port number of the server.
