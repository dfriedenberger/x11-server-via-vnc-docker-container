
# X11 Server via VNC Docker Container

This project provides a modular Docker-based environment for running an X11 server with VNC access and a choice of window managers. It is designed for flexibility, testing, and remote desktop scenarios.

## Features
- Modular architecture: separate containers for X11 server, window manager, noVNC, and test apps
- Multiple window manager options: Openbox, Fluxbox, IceWM (selectable via environment variable)
- VNC server for remote desktop access
- Web-based VNC access via noVNC
- Customizable background image (set via feh in the window manager container)

## Folder Structure
- `docker-compose.yml` – Orchestrates all containers and their networking
- `x11-server/` – X11 and VNC server setup, configuration, and startup scripts
- `window-manager/` – Window manager logic (Openbox, Fluxbox, IceWM), background image, and startup script
- `novnc/` – noVNC web client for browser-based VNC access
- `test/` – Minimal container for running X11 test applications

## Getting Started
1. Clone this repository:
   ```bash
   git clone https://github.com/dfriedenberger/x11-server-via-vnc-docker-container.git
   cd x11-server-via-vnc-docker-container
   ```

2. Build and start the main containers:
   ```bash
   docker compose up --build
   ```

3. (Optional) To start the `test` container, use the `test` profile:
   ```bash
   docker compose --profile test up --build
   ```

   `test` uses the internal Docker network. `test2` connects via `host.docker.internal:1` and therefore requires the X11 port `6001` to be published on the host.

4. Access the desktop:
   - With a VNC client: connect to `localhost:5901` (default password: `ubuntu`)
   - With your browser: open [http://localhost:6080/vnc.html](http://localhost:6080/vnc.html) for noVNC

## Customization
- Change the window manager by setting the `WM` environment variable in `docker-compose.yml` (`openbox`, `fluxbox`, or `icewm`)
- Replace `bgimage.jpg` in `window-manager/` to use your own background image
- Extend the `test/` container to run your own X11 applications

## How it works
- The `x11-server` container runs Xorg and a VNC server on display `:1`
- The `window-manager` container waits for the X11 server, sets the background, and starts the selected window manager
- The `novnc` container provides web access to the VNC server
- All containers communicate via a custom Docker bridge network

## License
MIT License

## Author
[Dirk Friedenberger](https://github.com/dfriedenberger)
