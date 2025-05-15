# go-aws-docker-ci-example

This is a minimal Go REST API example with a complete CI/CD pipeline using:

- 🐹 Golang
- 🐳 Docker (multi-stage builds)
- ⚙️ GitHub Actions (CI)
- ☁️ AWS EC2 (deployment)
- 📦 Docker Hub (image registry)

---

## 🔧 Local Setup

```bash
git clone https://github.com/<your-username>/go-aws-docker-ci-example.git
cd go-aws-docker-ci-example
docker build -t go-example .
docker run -p 8080:8080 go-example