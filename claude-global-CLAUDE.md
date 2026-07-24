# Glasgow — Machine-Level Notes

## What this box is
Ubuntu 24, LXC container (Proxmox host: Malua). Hosts two related but separate
projects: /opt/lrh_search_v2 (live production) and /opt/lrh_search_v3 (in
development). Each has its own project-level CLAUDE.md — this file is only for
facts that are true about the machine/environment itself, not either project.

## Dotfiles
Repo at ~/dotfiles (GitHub: netdesignate/dotfiles). ~/.bash_aliases and ~/.bashrc
are both symlinks into it. The `newalias` shell function (defined in
~/dotfiles/.functions) adds NEW aliases only — it refuses to touch an existing
one, so editing an alias always needs a manual sed/editor pass + explicit
git add/commit/push from ~/dotfiles, not another newalias call.

## Project aliases
- `lrhv2` — cd /opt/lrh_search_v2 && source .venv/bin/activate && export
  ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY_V2"
- `lrhv3` — same pattern for v3, $ANTHROPIC_API_KEY_V3
Both underlying vars are set in ~/.bashrc from /etc/lrh_search.env and
/etc/lrh_search_v3.env respectively (mode 640, root:users). Each project has its
OWN Anthropic API key for clean cost attribution — never cross-set these, and
never write an actual key value into any file, including this one.

## Claude Code itself
Installed via the native installer (~/.local/bin/claude, added to PATH via
~/.bashrc). Auto-update channel set to "stable" in ~/.claude/settings.json
(deliberately not latest, given how deliberately everything else on this box
is run).

## Terminal / known paste issue
SSH client history: SecureCRT 8.5.2 (build 1799, from 2018) had a confirmed
multi-line-paste bug — long pastes with blank lines split into multiple
submitted messages, with internal line-wrap newlines silently dropped (words
fused together, no space). Moved to Tabby (free, open-source) as the fix.
If this ever resurfaces on a new client: the reliable workaround is writing the
instruction to a file via a heredoc (bash's own stdin, bypasses the paste
handler entirely) and telling Claude Code to read that file, rather than
pasting directly into the prompt.

## Shared corpus locations (used by both v2 and v3 work)
- /srv/storage/Shared/LRH/ — source corpus root
- /srv/storage/Shared/LRH-Gold/ — curated Gold extractions
- /srv/storage/Shared/_pagesplit_quarantine/ — shared quarantine for removed
  PageSplit files (both v2 batches land here; deliberately a sibling of LRH/,
  outside the indexer's scanned corpus root, so quarantined files can never be
  silently re-indexed)

## Standing conventions across both projects
- Dry-run before any DB write or file deletion. Always.
- Verify a script's own claimed success by independently re-querying the
  DB/files — never trust a script's printed summary alone.
- Destructive file removal is always reversible first (mv to quarantine), with
  the actual rm as a separate, later, deliberate step.
- One canonical script per task — fold fixes into the existing script rather
  than leaving a parallel "v2"/"widened"/etc. variant sitting alongside it.
