# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ROSETTA_SHOW="${SPACESHIP_ROSETTA_SHOW=true}"
SPACESHIP_ROSETTA_PREFIX="${SPACESHIP_ROSETTA_PREFIX=""}"
SPACESHIP_ROSETTA_SUFFIX="${SPACESHIP_ROSETTA_SUFFIX=" "}"
SPACESHIP_ROSETTA_SYMBOL="${SPACESHIP_ROSETTA_SYMBOL="📜 "}"
SPACESHIP_ROSETTA_COLOR="${SPACESHIP_ROSETTA_COLOR=166}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current arch
spaceship_rosetta() {
  [[ $SPACESHIP_ROSETTA_SHOW == false ]] && return

  spaceship::exists arch || return

  local rosetta_string=$(arch)

  [[ ${rosetta_string} == "arm64" ]] && return

  spaceship::section \
    "$SPACESHIP_ROSETTA_COLOR" \
    "$SPACESHIP_ROSETTA_PREFIX" \
    "${SPACESHIP_ROSETTA_SYMBOL}${rosetta_string}" \
    "${SPACESHIP_ROSETTA_SUFFIX}"
}
