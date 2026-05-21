const audio = await Service.import('audio')
const network = await Service.import('network')
const hyprland = await Service.import('hyprland')

const date = Variable("", {
    poll: [1000, 'date "+%H:%M:%S %b %e"'],
})

// 工作區組件
const Workspaces = () => Widget.Box({
    class_name: "workspaces",
    children: hyprland.bind("workspaces").as(ws => 
        ws.sort((a, b) => a.id - b.id).map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.message(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: hyprland.active.workspace.bind("id").as(i => 
                `${i === id ? "focused" : ""}`
            ),
        }))
    ),
})

const VolumeSlider = () => Widget.Box({
    class_name: "volume-slider",
    children: [
        Widget.Icon({
            icon: audio.speaker.bind("icon_name"),
        }),
        Widget.Slider({
            hexpand: true,
            draw_value: false,
            on_change: ({ value }) => audio.speaker.volume = value,
            value: audio.speaker.bind("volume"),
        }),
    ],
})

const NetworkIndicator = () => Widget.Icon({
    icon: network.wifi.bind("icon_name"),
})

const SystemMenu = () => Widget.Box({
    vertical: true,
    class_name: "system-menu",
    children: [
        Widget.Box({
            class_name: "menu-item",
            children: [Widget.Label("Volume"), VolumeSlider()],
        }),
        Widget.Box({
            class_name: "menu-item",
            children: [
                Widget.Label("WiFi: "),
                Widget.Label({ label: network.wifi.bind("ssid").as(s => s || "Disconnected") }),
            ],
        }),
    ],
})

const SystemWindow = () => Widget.Window({
    name: "system-window",
    class_name: "system-window",
    anchor: ["top", "right"],
    visible: false,
    child: SystemMenu(),
})

const Bar = (monitor = 0) => Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
        start_widget: Workspaces(),
        center_widget: Widget.Label({
            label: date.bind(),
        }),
        end_widget: Widget.Button({
            on_primary_click: () => App.toggleWindow("system-window"),
            child: Widget.Box({
                children: [
                    NetworkIndicator(),
                    Widget.Label({ label: " System" }),
                ],
            }),
        }),
    }),
})

App.config({
    style: "./style.css",
    windows: [
        Bar(),
        SystemWindow(),
    ],
})

const battery = await Service.import("battery")
