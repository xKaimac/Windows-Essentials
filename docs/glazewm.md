# Config file for [GlazeWM](https://github.com/glzr-io/glazewm)
Most of this is default, but there are some changes.

---
## Window Spacing
Reduces the default spacing between windows, and allows some headroom for [Zebar](https://github.com/glzr-io/zebar) 

```yaml
gaps:
  # Gap between adjacent windows.
  inner_gap: "5px"

  # Gap between windows and the screen edge.
  outer_gap:
    top: "50px"
    right: "10px"
    bottom: "10px"
    left: "10px"
```
---
## Monitor definitions for workspaces
Monitors are numbered 0-n left-right. Just binds workspaces to default screens

```yaml
workspaces:
  - name: "1"
    display_name: "Main"
    bind_to_monitor: 0
  - name: "2"
    display_name: "Terminal"
    bind_to_monitor: 1
```
---
## Window Rules
Moves apps to their relevant workspace by default, really nice QOL.

```yaml
window_rules:
  # Rules for Teams and Firefox
  - commands: ["move --workspace 1"]
    match:
      - window_process: { equals: "teams" }
  - commands: ["move --workspace 1"]
    match:
      - window_process: { equals: "firefox" }

  # Rules for PowerShell windows
  - commands: ["move --workspace 2"]
    match:
      - window_process: { equals: "terminal" }
      - window_title: { regex: "Administrator" }
    count: 1
  - commands: ["move --workspace 2"]
    match:
      - window_process: { equals: "terminal" }
      - window_title: { regex: "Administrator" }
    count: 1
```
