terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    zpa = {
      source  = "zscaler/zpa"
      version = "~> 2.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
  }

  required_version = ">= 0.13.7, < 2.0.0"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "zpa" {
}
