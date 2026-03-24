# Environment Configuration

This documentation lists all supported environment variables that govern server functionality and specific Terraria server configurations. By utilizing environment variables during the container execution, you bypass the need for a manually created configuration file.

## General Setup Variables
| Variable | Default Value | Description |
|-----------|---------------|-------------|
| TMOD_SHUTDOWN_MESSAGE | `Server is shutting down NOW!` | Sent to the in-game chat when the container halts. |
| TMOD_AUTOSAVE_INTERVAL | `10` | The frequency in minutes the world auto-saves. |
| TMOD_AUTODOWNLOAD | `""` | A comma-separated list of Workshop Mod IDs. Fetches updates/mods upon container spin-up. |
| TMOD_ENABLEDMODS | `""` | A comma-separated list of Workshop Mod IDs. Adds these mods to the `enabled.json` to boot them up on the server. |
| TMOD_USECONFIGFILE | `No` | [Deprecated structure]. Retains a fallback behavior mapped through standard server configuration files `/root/terraria-server/serverconfig.txt` rather than environment parsing. |
| TMOD_PORT | `7777` | External container exposed port to reach out to the tModLoader server. |
| TMOD_PRIORITY | `1` | Startup priority assigned to tModLoader processes. |

## Server Detail Configuration
| Variable | Default Value | Description |
|-----------|---------------|-------------|
| TMOD_MOTD | `A tModLoader server powered by Docker!` | In-game chat broadcast immediately upon a user session start. |
| TMOD_PASS | `docker` | Limits server access requiring this shared secret string on connect. Disable by using `""` or `N/A`. |
| TMOD_MAXPLAYERS | `8` | Maximum concurrent player connections to the game instance. |
| TMOD_LANGUAGE | `en-US` | Localization configuration `en-US`, `de-DE`, `es-ES`, etc. |
| TMOD_NPCSTREAM | `60` | Bandwidth allocation metric. Low values mitigate lag/jumping of enemies but consume higher data overhead. 0 turns functionality off. |
| TMOD_UPNP | `0` | Automated Port-Forward handling functionality over uPNP devices (if compatible). |
| TMOD_SECURE | `0` | Cheat protection mechanism switch (integer flag). |

## World Generation Settings
*Important Note: The following variables are assessed exclusively when generating a brand NEW world file.*

| Variable | Default Value | Description |
|-----------|---------------|-------------|
| TMOD_WORLDNAME | `Docker` | Name of the newly minted `.WLD` system and internal world map. |
| TMOD_WORLDSIZE | `3` | Dimensions calculation constraint. `1` = Small, `2` = Medium, `3` = Large. |
| TMOD_WORLDSEED | `Docker` | Alpha/numeric generation seed logic definition base. |
| TMOD_DIFFICULTY | `1` | Environmental threat level adjustment flag. `0` = Normal, `1` = Expert, `2` = Master, `3` = Journey. |

## Journey Mode Power Management Permissions
Applies only when `TMOD_DIFFICULTY=3`.
Flags reference structure: 
- `0`: Locked (No user access)
- `1`: Host-only changes acceptable
- `2`: Democratic power modification

| Variables mapped inside Journey Config: | Description |
|------------------------------------------|-------------|
| TMOD_JOURNEY_SETFROZEN | Time-stops behavior handling |
| TMOD_JOURNEY_SETDAWN | Change cycle -> Morning |
| TMOD_JOURNEY_SETNOON | Change cycle -> Midday |
| TMOD_JOURNEY_SETDUSK | Change cycle -> Night-Fall |
| TMOD_JOURNEY_SETMIDNIGHT | Change cycle -> Witching Hours |
| TMOD_JOURNEY_GODMODE | Damage/invulnerability overrides |
| TMOD_JOURNEY_WIND_STRENGTH | Intensity multipliers context towards breezes. |
| TMOD_JOURNEY_RAIN_STRENGTH | Water precipitations override values. |
| TMOD_JOURNEY_TIME_SPEED | Cycle advancement rate modifiers flag. |
| TMOD_JOURNEY_RAIN_FROZEN | Storm continuity lock toggles. |
| TMOD_JOURNEY_WIND_FROZEN | Breeze directions continuity lock toggles. |
| TMOD_JOURNEY_PLACEMENT_RANGE | Construction distance constraint rules. |
| TMOD_JOURNEY_SET_DIFFICULTY | Runtime threat modifier flags scaling. |
| TMOD_JOURNEY_BIOME_SPREAD | Contagion logic (Hollow/Corruption/Crimson) constraint definitions. |
| TMOD_JOURNEY_SPAWN_RATE | NPC spawning rate modifications flags. |
