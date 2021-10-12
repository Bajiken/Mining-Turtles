from Bar import *
from Generate import *

filePath = "./lights/Cradles/"

white = "32767"
gray = "23254"
darkGray = "13741"

chorus1 = ["23254","32767","32767","23254"]
side1 = ["13741","23254","23254","13741"]
chorus2 = ["32767","32767","23254","23254"]
side2 = ["23254","23254","13741","13741"]

bars = []
# Bar 1
bars.append(
        [
            LightBar({1,2}, StaticBar("32767")),
            LightBar({3,4}, StaticBar("23254")),
            LightBar({5,6}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({77,76}, StaticBar("32767")),
            LightBar({75,74}, StaticBar("23254")),
            LightBar({73,72}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({15,8}, StaticBar("32767")),
            LightBar({1,2}, StaticBar("23254")),
            LightBar({3,4}, StaticBar("13741")),

            LightBar({18,19}, Bar(chorus1)),
            LightBar({11,12,17,20,25,26}, Bar(side1))
        ]
    )
bars.append(
        [
            LightBar({63,70}, StaticBar("32767")),
            LightBar({77,76}, StaticBar("23254")),
            LightBar({75,74}, StaticBar("13741")),

            LightBar({31,32}, Bar(chorus1)),
            LightBar({24,25,30,33,38,39}, Bar(side1))
        ]
    )
bars.append(
        [
            LightBar({29,22}, StaticBar("32767")),
            LightBar({15,8}, StaticBar("23254")),
            LightBar({1,2}, StaticBar("13741")),

            LightBar({39,40}, Bar(chorus1)),
            LightBar({32,33,38,41,46,47}, Bar(side1))
        ]
    )
bars.append(
        [
            LightBar({49,56}, StaticBar("32767")),
            LightBar({63,70}, StaticBar("23254")),
            LightBar({77,76}, StaticBar("13741")),

            LightBar({52,53}, Bar(chorus1)),
            LightBar({45,46,51,54,59,60}, Bar(side1))
        ]
    )
bars.append(
        [
            LightBar({43,36}, StaticBar("32767")),
            LightBar({29,22}, StaticBar("23254")),
            LightBar({15,8}, StaticBar("13741")),

            LightBar({60,61}, Bar(chorus1)),
            LightBar({53,54,59,62,67,68}, Bar(side1))
        ]
    )
bars.append(
        [
            LightBar({35,42}, StaticBar("32767")),
            LightBar({49,56}, StaticBar("23254")),
            LightBar({63,70}, StaticBar("13741"))
        ]
    )

# Bar 2
bars.append(
        [
            LightBar({57,50}, StaticBar("32767")),
            LightBar({43,36}, StaticBar("23254")),
            LightBar({29,22}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({21,28}, StaticBar("32767")),
            LightBar({35,42}, StaticBar("23254")),
            LightBar({49,56}, StaticBar("13741")),

            LightBar({18,19}, Bar(["0","0","23254","23254"])),
            LightBar({11,12,17,20,25,26}, Bar(["0","0","13741","13741"]))
        ]
    )
bars.append(
        [
            LightBar({71,64}, StaticBar("32767")),
            LightBar({57,50}, StaticBar("23254")),
            LightBar({43,36}, StaticBar("13741")),

            LightBar({18,19}, Bar(chorus2)),
            LightBar({11,12,17,20,25,26}, Bar(side2))
        ]
    )
bars.append(
        [
            LightBar({7,14}, StaticBar("32767")),
            LightBar({21,28}, StaticBar("23254")),
            LightBar({35,42}, StaticBar("13741")),

            LightBar({60,61}, Bar(chorus2)),
            LightBar({53,54,59,62,67,68}, Bar(side2))
        ]
    )
bars.append(
        [
            LightBar({73,72}, StaticBar("32767")),
            LightBar({71,64}, StaticBar("23254")),
            LightBar({57,50}, StaticBar("13741")),

            LightBar({31,32}, Bar(chorus2)),
            LightBar({24,25,30,33,38,39}, Bar(side2))
        ]
    )
bars.append(
        [
            LightBar({5,6}, StaticBar("32767")),
            LightBar({7,14}, StaticBar("23254")),
            LightBar({21,28}, StaticBar("13741")),

            LightBar({39,40}, Bar(chorus2)),
            LightBar({32,33,38,41,46,47}, Bar(side2))
        ]
    )
bars.append(
        [
            LightBar({75,74}, StaticBar("32767")),
            LightBar({73,72}, StaticBar("23254")),
            LightBar({71,64}, StaticBar("13741")),

            LightBar({52,53}, Bar(chorus2)),
            LightBar({45,46,51,54,59,60}, Bar(side2))
        ]
    )
bars.append(
        [
            LightBar({3,4}, StaticBar("32767")),
            LightBar({5,6}, StaticBar("23254")),
            LightBar({7,14}, StaticBar("13741")),

            LightBar({60,61}, Bar(chorus2)),
            LightBar({53,54,59,62,67,68}, Bar(side2))
        ]
    )

# Bar 3
bars.append(
        [
            LightBar({77,76}, StaticBar("32767")),
            LightBar({75,74}, StaticBar("23254")),
            LightBar({73,72}, StaticBar("13741")),

            LightBar({60,61}, Bar(["23254","23254","0","0"])),
            LightBar({53,54,59,62,67,68}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({1,2}, StaticBar("32767")),
            LightBar({3,4}, StaticBar("23254")),
            LightBar({5,6}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({63,70}, StaticBar("32767")),
            LightBar({77,76}, StaticBar("23254")),
            LightBar({75,74}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({15,8}, StaticBar("32767")),
            LightBar({1,2}, StaticBar("23254")),
            LightBar({3,4}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({49,56}, StaticBar("32767")),
            LightBar({63,70}, StaticBar("23254")),
            LightBar({77,76}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({29,22}, StaticBar("32767")),
            LightBar({15,8}, StaticBar("23254")),
            LightBar({1,2}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({35,42}, StaticBar("32767")),
            LightBar({49,56}, StaticBar("23254")),
            LightBar({63,70}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({43,36}, StaticBar("32767")),
            LightBar({29,22}, StaticBar("23254")),
            LightBar({15,8}, StaticBar("13741"))
        ]
    )

# Bar 4
bars.append(
        [
            LightBar({21,28}, StaticBar("32767")),
            LightBar({35,42}, StaticBar("23254")),
            LightBar({49,56}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({57,50}, StaticBar("32767")),
            LightBar({43,36}, StaticBar("23254")),
            LightBar({29,22}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({7,14}, StaticBar("32767")),
            LightBar({21,28}, StaticBar("23254")),
            LightBar({35,42}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({71,64}, StaticBar("32767")),
            LightBar({57,50}, StaticBar("23254")),
            LightBar({43,36}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({5,6}, StaticBar("32767")),
            LightBar({7,14}, StaticBar("23254")),
            LightBar({21,28}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({73,72}, StaticBar("32767")),
            LightBar({71,64}, StaticBar("23254")),
            LightBar({57,50}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({3,4}, StaticBar("32767")),
            LightBar({5,6}, StaticBar("23254")),
            LightBar({7,14}, StaticBar("13741"))
        ]
    )
bars.append(
        [
            LightBar({75,74}, StaticBar("32767")),
            LightBar({73,72}, StaticBar("23254")),
            LightBar({71,64}, StaticBar("13741"))
        ]
    )

bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])

bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])

bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])

bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
bars.append([])
generateFile(bars, filePath, 77)
