#!/bin/bash
set -euo pipefail

RESOURCE_GROUP="rg-challengedevops"
VM_NAME="vm-challengedevops"
LOCATION="brazilsouth"
USERNAME="azureuser"
PROJECT_FOLDER="."
PORT_LOCAL=80
PORT_CONTAINER=5087

function cleanup_on_error {
  echo "❌ Erro detectado! Limpando recursos criados..."
  az group delete --name "$RESOURCE_GROUP" --yes --no-wait || true
}
trap cleanup_on_error ERR

echo "🔐 Logando no Azure..."

echo "📦 Criando grupo de recursos..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "💻 Criando VM..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image Ubuntu2204 \
  --admin-username $USERNAME \
  --generate-ssh-keys \
  --output none

echo "🌐 Abrindo porta..."
az vm open-port --port $PORT_LOCAL --resource-group $RESOURCE_GROUP --name $VM_NAME

IP=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP -d --query publicIps -o tsv)
echo "🔎 IP Público: $IP"

echo "🐳 Instalando Docker..."
az vm run-command invoke \
  --command-id RunShellScript \
  --name $VM_NAME \
  --resource-group $RESOURCE_GROUP \
  --scripts "curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && usermod -aG docker $USERNAME"

echo "📁 Copiando projeto..."
scp -r "$PROJECT_FOLDER" "$USERNAME@$IP:/home/$USERNAME/challengedevops"

echo "🐳 Buildando e rodando container..."
ssh "$USERNAME@$IP" << EOF
cd challengedevops
docker build -t challengedevops .
docker run -d -p $PORT_LOCAL:$PORT_CONTAINER --name my-container challengedevops
EOF

echo "✅ Tudo pronto! Acesse: http://$IP"
