import QtQuick 2.0

Item {
    id: valueSource
    property real kph: 0
    property real rpm: 1
    property real fuel: 50
    property string gear: {
        var g;
        if (kph == 0) {
            return "P";
        }
        if (kph < 23) {
            return "1";
        }
        if (kph < 41) {
            return "2";
        }
        if (kph < 61) {
            return "3";
        }
        if (kph < 101) {
            return "4";
        }
        if (kph < 160) {
            return "5";
        }
    }

    property real temperature: 70
    property bool start: true
//! [0]

    SequentialAnimation {
        running: true
        loops: 1

        // We want a small pause at the beginning, but we only want it to happen once.
        PauseAnimation {
            duration: 1000
        }

        PropertyAction {
            target: valueSource
            property: "start"
            value: false
        }

        SequentialAnimation {
            loops: Animation.Infinite

//! 1-2
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 0
                    to: 22
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 1
                    to: 4.9
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 50
                    to: 45
                    duration: 3000
                }
            }
// wait
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 22
                    to: 18
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 4.9
                    to: 2.1
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 71
                    duration: 600
                }
            }
//! 2-3
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 18
                    to: 40
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 2.1
                    to: 5.1
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 45
                    to: 40
                    duration: 3000
                }
            }
// wait
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 40
                    to: 36
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 5.1
                    to: 2.4
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 72
                    duration: 600
                }
            }
// 3-4
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 60
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.5
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 40
                    to: 32
                    duration: 3000
                }
            }
// Wait
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 56
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.3
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 73
                    duration: 600
                }
            }
// 4-5
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 100
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.1
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 32
                    to: 25
                    duration: 3000
                }
            }
// wait
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 96
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.2
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 74
                    duration: 600
                }
            }
// 5
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 145
                    duration: 4000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 6.2
                    duration: 4000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 25
                    to: 18
                    duration: 3000
                }
            }

// Start downshifting.
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.Linear
                    to: 100
                    duration: 5000
                }

                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 3.1
                    duration: 5000
                }
            }
// 5-4
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 5.5
                duration: 600
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.Linear
                    to: 60
                    duration: 5000
                }

                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 3.1
                    duration: 5000
                }
            }

// 4-3
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 5.5
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 40
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
            }

// 3-2
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.3
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 22
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
            }
// 2-1
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.5
                duration: 600
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 0
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 1
                    duration: 4500
                }
            }
//fuel
            NumberAnimation {
                target: valueSource
                property: "fuel"
                easing.type: Easing.InOutSine
                to: 50
                duration: 600
            }
            NumberAnimation {
                target: valueSource
                property: "temperature"
                easing.type: Easing.InOutSine
                to: 70
                duration: 600
            }
            PauseAnimation {
                duration: 5000
            }
        }
    }
}
