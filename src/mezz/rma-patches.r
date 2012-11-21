REBOL [
	Title: "REBOL Graphics - load-gui patch"
]

load-gui: func [
    "Download current GUI module from web. (Temporary)"
    /local data
][
    print "Fetching GUI..."
    either error? data: try [load http://www.rm-asset.com/code/downloads/files/r3-gui.r3] [
        either data/id = 'protocol [print "Cannot load GUI from web."] [do err]
    ] [
        do data
    ]
    exit
]
