#!/usr/bin/env bash
# =============================================================================
# WoW Argentina — FusionCMS Patch Installer
# Fixes: UCP/character Spanish translations, Bootstrap dark overrides
#
# USAGE:
#   cd /path/to/repo-clone
#   BASE_DIR=/var/www/wowarg bash scripts/install.sh
#
# REQUIREMENTS:
#   - Run from the root of the cloned repository
#   - php binary in PATH (php -l for syntax check)
#   - Write access to BASE_DIR and /var/backups/wowarg
# =============================================================================
set -euo pipefail

# ---- CONFIGURATION ----------------------------------------------------------
BASE_DIR="${BASE_DIR:-/var/www/wowarg}"
BACKUP_DIR="${BACKUP_DIR:-/var/backups/wowarg/$(date +%Y%m%d_%H%M%S)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# ---- COLORS -----------------------------------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }
step()  { echo -e "${BLUE}\n====${NC} $* ${BLUE}====${NC}"; }

# ---- PREFLIGHT --------------------------------------------------------------
step "Preflight checks"
[[ -d "$BASE_DIR" ]] || error "BASE_DIR no existe: $BASE_DIR\n  Edita la variable BASE_DIR al inicio del script o pasa BASE_DIR=/ruta bash scripts/install.sh"
command -v php >/dev/null 2>&1 || error "PHP no encontrado en el PATH."
info "Repositorio: $REPO_ROOT"
info "Destino VPS: $BASE_DIR"
info "Backup:      $BACKUP_DIR"

# ---- PATCH FILE LIST --------------------------------------------------------
# Relative paths from repo root == relative paths from BASE_DIR
PATCH_FILES=(
    "application/modules/character/language/spanish/character.php"
    "application/modules/character/language/english/character.php"
    "application/modules/ucp/language/english/ucp.php"
    "application/modules/ucp/language/spanish/ucp.php"
    "application/modules/ucp/views/ucp_navigation.tpl"
    "application/modules/ucp/views/ucp.tpl"
    "application/modules/profile/views/ucp_characters.tpl"
    "application/modules/character/views/character.tpl"
    "application/themes/wowarg/css/custom.css"
)

# ---- BACKUP -----------------------------------------------------------------
step "Creando respaldos"
mkdir -p "$BACKUP_DIR"
for rel in "${PATCH_FILES[@]}"; do
    src="$BASE_DIR/$rel"
    dest="$BACKUP_DIR/$rel"
    if [[ -f "$src" ]]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        info "  backed up: $rel"
    else
        warn "  no existe en VPS (se creara nuevo): $rel"
    fi
done
info "Backup guardado en: $BACKUP_DIR"

# ---- PHP SYNTAX CHECK -------------------------------------------------------
step "Verificando sintaxis PHP"
for rel in "${PATCH_FILES[@]}"; do
    src="$REPO_ROOT/$rel"
    if [[ -f "$src" && "$rel" == *.php ]]; then
        if php -l "$src" >/dev/null 2>&1; then
            info "  OK: $rel"
        else
            error "  Error de sintaxis PHP en: $rel\n  Abortando. Backup disponible en: $BACKUP_DIR"
        fi
    fi
done
info "Todos los archivos PHP pasan la verificacion de sintaxis."

# ---- DEPLOY -----------------------------------------------------------------
step "Desplegando archivos"
DEPLOYED=0
for rel in "${PATCH_FILES[@]}"; do
    src="$REPO_ROOT/$rel"
    dest="$BASE_DIR/$rel"
    if [[ -f "$src" ]]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        info "  deployed: $rel"
        ((DEPLOYED++))
    else
        warn "  archivo de parche no encontrado en repo: $src"
    fi
done
info "$DEPLOYED archivos desplegados."

# ---- CLEAR SMARTY CACHE -----------------------------------------------------
step "Limpiando cache de Smarty / FusionCMS"
CACHE_DIRS=(
    "$BASE_DIR/writable/cache"
    "$BASE_DIR/application/cache"
    "$BASE_DIR/cache"
)
for cdir in "${CACHE_DIRS[@]}"; do
    if [[ -d "$cdir" ]]; then
        # Remove compiled Smarty templates (*.php inside cache)
        find "$cdir" -name '*.php' -type f -delete 2>/dev/null && info "  Smarty compiled templates eliminados: $cdir" || true
        # Remove minified CSS/JS cache so custom.css changes take effect
        find "$cdir" -name 'wowarg_all.min*' -type f -delete 2>/dev/null && info "  Minify cache eliminado: $cdir" || true
    fi
done

# ---- OPCACHE ----------------------------------------------------------------
step "Reiniciando OPcache PHP"
if php -r 'exit(function_exists("opcache_reset") ? 0 : 1);' 2>/dev/null; then
    php -r 'opcache_reset(); echo "OPcache reiniciado." . PHP_EOL;'
else
    warn "OPcache no disponible via CLI."
    warn "Si los cambios PHP no surten efecto, ejecuta:"
    warn "  sudo systemctl reload php8.4-fpm"
fi

# ---- DONE -------------------------------------------------------------------
echo ""
echo -e "${GREEN}============================================================${NC}"
echo -e "${GREEN}  Parche instalado correctamente en:${NC} $BASE_DIR"
echo -e "${GREEN}  Backup guardado en:${NC} $BACKUP_DIR"
echo ""
echo -e "${YELLOW}  Si los cambios no se ven de inmediato, ejecuta:${NC}"
echo -e "    sudo systemctl reload php8.4-fpm"
echo -e "${GREEN}============================================================${NC}"
