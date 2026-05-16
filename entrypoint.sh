#!/bin/sh
exec /bin/openra-server \
    Engine.EngineDir=/lib/openra \
    ${SUPPORT_DIR:+Engine.SupportDir="${SUPPORT_DIR}"} \
    Game.Mod="${MOD:-ra}" \
    Server.Name="${SERVER_NAME:-Dedicated Server}" \
    Server.Map="${MAP:-}" \
    Server.ListenPort="${LISTEN_PORT:-1234}" \
    Server.AdvertiseOnline="${ADVERTISE_ONLINE:-True}" \
    Server.AdvertiseOnLocalNetwork="${ADVERTISE_LOCAL:-True}" \
    Server.Password="${PASSWORD:-}" \
    Server.RecordReplays="${RECORD_REPLAYS:-False}" \
    Server.RequireAuthentication="${REQUIRE_AUTH:-False}" \
    Server.ProfileIDBlacklist="${PROFILE_BLACKLIST:-}" \
    Server.ProfileIDWhitelist="${PROFILE_WHITELIST:-}" \
    Server.EnableSingleplayer="${ENABLE_SINGLEPLAYER:-False}" \
    Server.EnableSyncReports="${ENABLE_SYNC_REPORTS:-False}" \
    Server.EnableGeoIP="${ENABLE_GEOIP:-True}" \
    Server.EnableLintChecks="${ENABLE_LINT_CHECKS:-True}" \
    Server.ShareAnonymizedIPs="${SHARE_ANON_IPS:-True}" \
    Server.FloodLimitJoinCooldown="${FLOOD_LIMIT_JOIN_COOLDOWN:-5000}"
