#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# 設定セクション（必要なら書き換え）
# ============================================================
GTK_THEME_NAME="Dracula"
GTK_REPO_URL="https://github.com/dracula/gtk.git"

ROFI_REPO_URL="https://github.com/dracula/rofi.git"
ROFI_THEME_FILE="config1.rasi"   # config1.rasi / config2.rasi など

THEMES_DIR="${HOME}/.themes"
ROFI_CONFIG_DIR="${HOME}/.config/rofi"

# mktemp 用。main 内で初期化される
TMPDIR=""
# ============================================================

cleanup() {
  # clone した一時ディレクトリを削除
  if [[ -n "${TMPDIR}" && -d "${TMPDIR}" ]]; then
    rm -rf "${TMPDIR}"
  fi
}

check_commands() {
  local cmds=("git")
  for cmd in "${cmds[@]}"; do
    if ! command -v "${cmd}" >/dev/null 2>&1; then
      echo "[!] '${cmd}' コマンドが見つかりません。インストールしてください。" >&2
      exit 1
    fi
  done
}

prepare_dirs() {
  mkdir -p "${THEMES_DIR}"
  mkdir -p "${ROFI_CONFIG_DIR}"
}

install_gtk_theme() {
  echo "[*] GTK テーマをダウンロード中..."
  git clone --depth 1 "${GTK_REPO_URL}" "${TMPDIR}/gtk"

  local target_gtk_dir="${THEMES_DIR}/${GTK_THEME_NAME}"

  if [[ -d "${target_gtk_dir}" ]]; then
    echo "[*] 既存の GTK テーマ '${target_gtk_dir}' をバックアップします..."
    mv "${target_gtk_dir}" "${target_gtk_dir}.bak.$(date +%s)"
  fi

  cp -r "${TMPDIR}/gtk" "${target_gtk_dir}"
  echo "[+] GTK テーマを ${target_gtk_dir} に配置しました"
}

apply_gtk_theme_gsettings() {
  if command -v gsettings >/dev/null 2>&1; then
    echo "[*] gsettings で GTK テーマを '${GTK_THEME_NAME}' に設定します..."
    gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_NAME}" 2>/dev/null || true
    gsettings set org.gnome.desktop.wm.preferences theme "${GTK_THEME_NAME}" 2>/dev/null || true
  else
    echo "[*] gsettings が見つからないため、GTK テーマの適用は各デスクトップ環境の設定ツールから行ってください。"
  fi
}

install_rofi_theme() {
  echo "[*] rofi テーマをダウンロード中..."
  git clone --depth 1 "${ROFI_REPO_URL}" "${TMPDIR}/rofi"

  local rofi_theme_src="${TMPDIR}/rofi/theme/${ROFI_THEME_FILE}"
  local rofi_config_path="${ROFI_CONFIG_DIR}/config.rasi"

  if [[ ! -f "${rofi_theme_src}" ]]; then
    echo "[!] rofi テーマファイルが見つかりません: ${rofi_theme_src}" >&2
    exit 1
  fi

  if [[ -f "${rofi_config_path}" ]]; then
    echo "[*] 既存の rofi 設定をバックアップします: ${rofi_config_path}"
    mv "${rofi_config_path}" "${rofi_config_path}.bak.$(date +%s)"
  fi

  cp "${rofi_theme_src}" "${rofi_config_path}"
  echo "[+] rofi テーマを ${rofi_config_path} に配置しました"
}

print_summary() {
  cat <<EOF

===============================================
 インストール完了 🎃

 GTK テーマ:
   名前: ${GTK_THEME_NAME}
   パス: ${THEMES_DIR}/${GTK_THEME_NAME}
   → デスクトップ環境の外観設定から '${GTK_THEME_NAME}' を選択してください

 rofi:
   設定: ${ROFI_CONFIG_DIR}/config.rasi
   → 'rofi -show drun' などで動作確認
===============================================
EOF
}

main() {
  echo "[*] Dracula GTK & rofi テーマをインストールします"

  check_commands
  prepare_dirs

  TMPDIR="$(mktemp -d)"
  # ここで trap を設定して、終了時に clone したディレクトリを削除
  trap cleanup EXIT

  install_gtk_theme
  apply_gtk_theme_gsettings
  install_rofi_theme
  print_summary
}

main "$@"

