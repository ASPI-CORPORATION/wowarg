#!/usr/bin/env bash
# =============================================================================
# WoW Argentina — FusionCMS Patch Rollback
# Restaura los archivos originales desde el backup creado por install.sh
#
# USAGE:
#   bash scripts/rollback.sh
#   BACKUP_DIR=/var/backups/wowarg/20250101_120000 bash scripts/rollback.sh
# =============================================================================
set -euo pipefail

# ---- CONFIGURATION ----------------------------------------------------------
BASE_DIR="${BASE_DIR:-/var/www/wowarg}"
BACKUP_BASE="/var/backups/wowarg"

# ---- COLORS -----------------------------------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }
step()  { echo -e "${BLUE}\n====${NC} $* ${BLUE}====${NC}"; }

# ---- FIND BACKUP ------------------------------------------------------------
step "Buscando backup"
if [[ -z "${BACKUP_DIR:-}" ]]; then
    BACKUP_DIR=$(ls -1dt "${BACKUP_BASE}"/20* 2>/dev/null | head -1 || true)
fi

[[ -n "${BACKUP_DIR}" ]] || \
    error "No se encontro ningun backup en $BACKUP_BASE\n  Especifica con: BACKUP_DIR=/ruta/al/backup bash scripts/rollback.sh"
[[ -d "${BACKUP_DIR}" ]] || \
    error "BACKUP_DIR no existe: ${BACKUP_DIR}"

info "Backup encontrado: ${BACKUP_DIR}"
info "Destino:           ${BASE_DIR}"

# ---- COUNT FILES ------------------------------------------------------------
FILE_COUNT=$(find "$BACKUP_DIR" -type f | wc -l)
[[ "$FILE_COUNT" -gt 0 ]] || error "El directorio de backup esta vacio."
info "Archivos a restaurar: $FILE_COUNT"

# ---- CONFIRM ----------------------------------------------------------------
echo ""
echo -e "${YELLOW}Este rollback sobreescribira los archivos actuales en:${NC}"
echo -e "  $BASE_DIR"
echo ""
read -rp "Confirmar rollback? [s/N] " CONFIRM
case "$CONFIRM" in
    [sS]|[sS][iI]) ;;
    *) echo "Rollback cancelado."; exit 0 ;;
esac

# ---- RESTORE ----------------------------------------------------------------
step "Restaurando archivos"
RESTORED=0
while IFS= read -r -d '' bfile; do
    rel_path="${bfile#${BACKUP_DIR}/}"
    dest="$BASE_DIR/$rel_path"
    mkdir -p "$(dirname "$dest")"
    cp "$bfile" "$dest"
    info "  restored: $rel_path"
    ((RESTORED++))
done < <(find "$BACKUP_DIR" -type f -print0)

info "$RESTORED archivos restaurados."

# ---- CLEAR CACHE ------------------------------------------------------------
step "Limpiando cache post-rollback"
for cdir in "$BASE_DIR/writable/cache" "$BASE_DIR/application/cache"; do
    if [[ -d "$cdir" ]]; then
        find "$cdir" -name '*.php' -type f -delete 2>/dev/null || true
        find "$cdir" -name 'wowarg_all.min*' -type f -delete 2>/dev/null || true
        info "  cache limpiada: $cdir"
    fi
done

# ---- DONE -------------------------------------------------------------------
echo ""
echo -e "${GREEN}============================================================${NC}"
echo -e "${GREEN}  Rollback completado.${NC}"
echo -e "  Recuerda recargar PHP-FPM si es necesario:"
echo -e "    sudo systemctl reload php8.4-fpm"
echo -e "${GREEN}============================================================${NC}"
