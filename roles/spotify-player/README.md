# Spotify player

Builds v0.25.2 with PulseAudio, daemon mode, media controls, streaming and TLS.

`files/track-album-context.patch` makes `playback start track` start the selected
track at its exact offset within its album. On this machine, bare track URI lists
produced librespot missing-context errors and Spotify's `403 Player command
failed: Restriction violated`; album-context requests succeeded with the same
credentials and device. Playback can continue through the album afterward.

The patch is applied only during compilation and reversed afterward, keeping the
upstream checkout clean for updates. A version-and-patch signature ensures that
changes to the patch trigger a rebuild. Revalidate it when upgrading upstream.
