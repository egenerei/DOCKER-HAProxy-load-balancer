# Docker HAProxy Load Balancer 🐳🔀

A Docker-based project that sets up HAProxy as a powerful load balancer to distribute traffic across your containerized services. 🚦🎛️

---

## 🚀 Features

- **HAProxy**: High-performance TCP/HTTP load balancing. ⚡🌐
- **Dockerized**: Runs entirely in Docker for easy deployment. 🐳📦
- **Docker Compose**: Orchestrate HAProxy and backend services with a single command. 🛠️📋
- **Health Checks**: Automatic backend health monitoring. ❤️‍🩹🔍
- **SSL Termination**: Offload TLS to HAProxy (optional config). 🔒✅
- **Dynamic Scaling**: Add or remove containers without downtime. ➕➖🎯
- **Metrics & Logging**: Integrate with Prometheus/Grafana or basic logging. 📈📝

---

## 🔧 Prerequisites

- [Docker](https://www.docker.com/) >= 20.x 🐋
- [Docker Compose](https://docs.docker.com/compose/) >= 1.29.x 🧩
- Git 🗃️

---

## 📥 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/egenerei/docker-haproxy-load-balancer.git
   cd docker-haproxy-load-balancer
   ```
2. Customize the `haproxy.cfg` if needed (see **Configuration** below). 🖊️
3. Start all services:
   ```bash
   docker-compose up -d
   ```
4. Verify HAProxy status:
   ```bash
   docker-compose exec haproxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
   ```
5. Browse to the load balancer endpoint:
   - HTTP: `http://localhost:8080` 🌐
   - Stats: `http://localhost:8080/haproxy?stats` (if enabled) 📊

---

## ⚙️ Configuration

### 📝 HAProxy Configuration (`haproxy/haproxy.cfg`)

- **Frontends**: Define entry points for HTTP/HTTPS traffic.
- **Backends**: List Docker service containers to balance.
- **Health Checks**: `option httpchk` for health status.
- **SSL**: Place certificates in `haproxy/certs/` and update `bind` lines. 🔐

### 🐳 Docker Compose (`docker-compose.yml`)

- **Services**:
  - **haproxy**: Image `haproxy:2.5-alpine`, maps port 8080.
  - **app1**, **app2**, ...: Example backend apps (e.g., NGINX, Node). 🔁
- **Networks**: `frontend` and `backend` networks for isolation. 🌐

---

## 📂 Directory Structure

```
.
├── docker-compose.yml
├── haproxy/
│   ├── haproxy.cfg         # Main HAProxy config
│   ├── certs/              # SSL certificates (optional)
│   └── Dockerfile          # Custom HAProxy build (optional)
├── services/
│   ├── app1/               # Backend service 1
│   │   ├── Dockerfile
│   │   └── ...
│   └── app2/               # Backend service 2
│       ├── Dockerfile
│       └── ...
└── README.md               # This file
```

---

## 🛠️ Usage Tips

- **Scale** a service:
  ```bash
  docker-compose up -d --scale app1=3
  ```
- **View logs**:
  ```bash
  docker-compose logs -f haproxy
  ```
- **Reload config** without downtime:
  ```bash
  docker-compose exec haproxy haproxy -f /usr/local/etc/haproxy/haproxy.cfg -sf $(cat /var/run/haproxy.pid)
  ```

---

## 🎨 Customization

- Tweak timeouts, load-balancing algorithms (`roundrobin`, `leastconn`). ⏱️🔄
- Enable advanced features: rate limiting, ACLs, stick tables. 🚦🛡️
- Integrate with service discovery (Consul, etcd). 🔍🌍

---

## 🐞 Troubleshooting

- **Config test**: `haproxy -c -f haproxy.cfg` to validate syntax.
- **Port conflicts**: Ensure port 8080 is free on the host. 🚧
- **Container status**: `docker ps` / `docker-compose ps` to check up/down. 📋

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details. 📝
