/*
    SPDX-FileCopyrightText: 2012 Gregor Taetzner <gregor@freenet.de>
    SPDX-FileCopyrightText: 2020 Ivan Čukić <ivan.cukic at kde.org>
    SPDX-FileCopyrightText: 2024 bendn <bend.n@outlook.com>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
    id: root

    width: Kirigami.Units.iconSizes.large
    height: Kirigami.Units.iconSizes.large

    Layout.maximumWidth: Infinity
    Layout.maximumHeight: Infinity

    Layout.preferredWidth: Kirigami.Units.iconSizes.large
    Layout.preferredHeight: Kirigami.Units.iconSizes.large

    Layout.minimumWidth: Kirigami.Units.iconSizes.large
    Layout.minimumHeight: Kirigami.Units.iconSizes.large

    Layout.fillWidth: true
    Layout.fillHeight: true

    Plasmoid.icon: Plasmoid.configuration.icon

    preferredRepresentation: fullRepresentation

    MouseArea {
        anchors.fill: parent
        onClicked: executable.exec(plasmoid.configuration.command)
        onPressed: executable.exec(plasmoid.configuration.command)

        Kirigami.Icon {
            width: Kirigami.Units.iconSizes.large
            height: Kirigami.Units.iconSizes.large
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: plasmoid.configuration.icon
            currentIconTheme: "Papirus-Dark"
        }
    }

    Plasma5Support.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: function(source, data) {
            disconnectSource(source)
        }

        function exec(cmd) {
            executable.connectSource(cmd)
        }
    }

}
