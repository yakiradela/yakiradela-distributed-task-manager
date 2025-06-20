#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200
vault login root

# Enable KV
vault secrets enable -path=secret kv-v2

# Policy
vault policy write flask-service ./policies/flask-service.hcl

# Add secret
vault kv put secret/flask-service @./secrets/flask-service.json

# Enable K8s auth
vault auth enable kubernetes

vault write auth/kubernetes/config \
    token_reviewer_jwt="YOUR_JWT" \
    kubernetes_host="https://kubernetes.default.svc:443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

vault write auth/kubernetes/role/flask-service \
    bound_service_account_names=default \
    bound_service_account_namespaces=distributed-task-manager \
    policies=flask-service \
    ttl=24h
