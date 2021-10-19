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

            LightBar({39,40}, Bar(chorus2)),
            LightBar({32,33,38,41,46,47}, Bar(side2))
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
            LightBar({5,6}, StaticBar("13741")),

            LightBar({17,18}, Bar(["0","32767","0","0"])),
            LightBar({10,11,16,19,24}, Bar(["0","23254","0","0"])),
            LightBar({32,33}, Bar(["0","0","32767","32767"])),
            LightBar({26,31,34,39,40}, Bar(["0","0","23254","23254"])),
            LightBar({25}, Bar(["0","23254","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({63,70}, StaticBar("32767")),
            LightBar({77,76}, StaticBar("23254")),
            LightBar({75,74}, StaticBar("13741")),

            LightBar({32,33}, Bar(["23254","23254","0","0"])),
            LightBar({25,26,31,34,39,40}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({15,8}, StaticBar("32767")),
            LightBar({1,2}, StaticBar("23254")),
            LightBar({3,4}, StaticBar("13741")),

            LightBar({18,19}, Bar(["0","32767","0","0"])),
            LightBar({11,12,17,20,26}, Bar(["0","23254","0","0"])),
            LightBar({31,32}, Bar(["0","0","32767","32767"])),
            LightBar({24,30,33,38,39}, Bar(["0","0","23254","23254"])),
            LightBar({25}, Bar(["0","23254","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({49,56}, StaticBar("32767")),
            LightBar({63,70}, StaticBar("23254")),
            LightBar({77,76}, StaticBar("13741")),

            LightBar({31,32}, Bar(["23254","23254","0","0"])),
            LightBar({24,25,30,33,38,39}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({29,22}, StaticBar("32767")),
            LightBar({15,8}, StaticBar("23254")),
            LightBar({1,2}, StaticBar("13741")),

            LightBar({59,60}, Bar(["0","32767","0","0"])),
            LightBar({52,58,61,66,67}, Bar(["0","23254","0","0"])),
            LightBar({46,47}, Bar(["0","0","32767","32767"])),
            LightBar({39,40,45,48,54}, Bar(["0","0","23254","23254"])),
            LightBar({53}, Bar(["0","23254","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({35,42}, StaticBar("32767")),
            LightBar({49,56}, StaticBar("23254")),
            LightBar({63,70}, StaticBar("13741")),

            LightBar({46,47}, Bar(["23254","23254","0","0"])),
            LightBar({39,40,45,48,53,54}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({43,36}, StaticBar("32767")),
            LightBar({29,22}, StaticBar("23254")),
            LightBar({15,8}, StaticBar("13741")),

            LightBar({60,61}, Bar(["0","32767","0","0"])),
            LightBar({54,59,62,67,68}, Bar(["0","23254","0","0"])),
            LightBar({45,46}, Bar(["0","0","32767","32767"])),
            LightBar({38,39,44,47,52}, Bar(["0","0","23254","23254"])),
            LightBar({53}, Bar(["0","23254","23254","23254"]))
        ]
    )

# Bar 4
bars.append(
        [
            LightBar({21,28}, StaticBar("32767")),
            LightBar({35,42}, StaticBar("23254")),
            LightBar({49,56}, StaticBar("13741")),

            LightBar({45,46}, Bar(["23254","23254","0","0"])),
            LightBar({38,39,44,47,52,53}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({57,50}, StaticBar("32767")),
            LightBar({43,36}, StaticBar("23254")),
            LightBar({29,22}, StaticBar("13741")),

            LightBar({39}, Bar(["0","32767","0","0"])),
            LightBar({31,32,33,38,40,45,46,47}, Bar(["0","23254","0","0"])),
            LightBar({11}, Bar(["0","0","32767","32767"])),
            LightBar({10,12,17,18,19}, Bar(["0","0","23254","23254"])),
            LightBar({67}, Bar(["0","0","32767","32767"])),
            LightBar({59,60,61,66,68}, Bar(["0","0","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({7,14}, StaticBar("32767")),
            LightBar({21,28}, StaticBar("23254")),
            LightBar({35,42}, StaticBar("13741")),

            LightBar({11}, Bar(["23254","23254","0","0"])),
            LightBar({10,12,17,18,19}, Bar(["13741","13741","0","0"])),
            LightBar({67}, Bar(["23254","23254","0","0"])),
            LightBar({59,60,61,66,68}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({71,64}, StaticBar("32767")),
            LightBar({57,50}, StaticBar("23254")),
            LightBar({43,36}, StaticBar("13741")),

            LightBar({9}, Bar(["0","32767","23254","23254"])),
            LightBar({10,16}, Bar(["0","23254","23254","23254"])),
            LightBar({17}, Bar(["0","23254","32767","32767"])),

            LightBar({13}, Bar(["0","32767","23254","23254"])),
            LightBar({12,20}, Bar(["0","23254","23254","23254"])),
            LightBar({19}, Bar(["0","23254","32767","32767"])),

            LightBar({65}, Bar(["0","32767","23254","23254"])),
            LightBar({58,66}, Bar(["0","23254","23254","23254"])),
            LightBar({59}, Bar(["0","23254","32767","32767"])),

            LightBar({69}, Bar(["0","32767","23254","23254"])),
            LightBar({62,68}, Bar(["0","23254","23254","23254"])),
            LightBar({61}, Bar(["0","23254","32767","32767"])),

            LightBar({11,18,23,24,25,26,27}, Bar(["0","0","23254","23254"])),
            LightBar({51,52,53,54,55,60,67}, Bar(["0","0","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({5,6}, StaticBar("32767")),
            LightBar({7,14}, StaticBar("23254")),
            LightBar({21,28}, StaticBar("13741")),

            LightBar({17}, Bar(["23254","23254","0","0"])),
            LightBar({19}, Bar(["23254","23254","0","0"])),
            LightBar({9,10,11,12,13,16,18,20,23,24,25,26,27}, Bar(["13741","13741","0","0"])),
            LightBar({59}, Bar(["23254","23254","0","0"])),
            LightBar({61}, Bar(["23254","23254","0","0"])),
            LightBar({51,52,53,54,55,58,60,62,65,66,67,68,69}, Bar(["13741","13741","0","0"]))
        ]
    )
bars.append(
        [
            LightBar({73,72}, StaticBar("32767")),
            LightBar({71,64}, StaticBar("23254")),
            LightBar({57,50}, StaticBar("13741")),

            LightBar({24,26,52,54}, Bar(["0","32767","23254","23254"])),
            LightBar({16,17,18,19,20}, Bar(["0","23254","0","0"])),
            LightBar({58,59,60,61,62}, Bar(["0","23254","0","0"])),

            LightBar({31,32,33,45,46,47}, Bar(["0","23254","32767","32767"])),
            LightBar({23,25,27,30,34,44,48,51,53,55}, Bar(["0","23254","23254","23254"])),

            LightBar({38,39,40}, Bar(["0","0","32767","32767"])),
            LightBar({37,41}, Bar(["0","0","23254","23254"]))
        ]
    )
bars.append(
        [
            LightBar({3,4}, StaticBar("32767")),
            LightBar({5,6}, StaticBar("23254")),
            LightBar({7,14}, StaticBar("13741")),

            LightBar({31,32,33,38,39,40,45,46,47}, Bar(["23254","23254","0","0"])),
            LightBar({23,24,25,26,27,30,34,37,41,44,48,51,52,53,54,55}, Bar(["13741","13741","0","0"])),
        ]
    )
bars.append([])

# Bar 5
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"]))
        ]
    )
bars.append(
        [
            LightBar({37,38,39,40,41}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({11,18,25,32,39,46,53,60,67}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({23,24,25,26,27}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({10,17,24,31,38,45,52,59,66}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({44,45,46,47,48}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({12,19,26,33,40,47,54,61,68}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({23,24,25,26,27}, StaticBar("32767")),
            LightBar({44,45,46,47,48}, StaticBar("32767"))
        ]
    )

# Bar 6
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({10,17,24,31,38,45,52,59,66}, StaticBar("32767")),
            LightBar({12,19,26,33,40,47,54,61,68}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({23,24,25,26,27}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({37,38,39,40,41}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({44,45,46,47,48}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({10,17,24,31,38,45,52,59,66}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({11,18,25,32,39,46,53,60,67}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({12,19,26,33,40,47,54,61,68}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({39}, StaticBar("32767"))
        ]
    )

# Bar 7
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"]))
        ]
    )
bars.append(
        [
            LightBar({16,10,12,20,58,66,68,62}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({30,24,18,12,10,26,34,44,52,60,68,66,54,48}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({9,13,65,69}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({23,17,11,19,27,51,59,67,61,55}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({37,31,25,19,13,9,17,25,33,41,65,59,53,47,45,53,61,69}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({32,38,40,46}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({10,16,17,18,24}, StaticBar("32767"))
        ]
    )

# Bar 8
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({54,60,61,62,68}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({12,18,19,20,26}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({52,58,59,60,66}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({31,32,33,38,40,45,46,47}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({30,31,32,33,34,37,41,44,45,46,47,48}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, AlternatingBar(["32767", "23254"])),
            LightBar({8,14,15,21,22,28,29,35,36,42,43,49,50,56,57,63,64,70}, AlternatingBar(["32767", "23254"])),
            LightBar({71,72,73,74,75,76,77}, AlternatingBar(["32767", "23254"])),

            LightBar({23,24,25,26,27,30,34,37,41,44,48,51,52,53,54,55}, StaticBar("32767"))
        ]
    )
bars.append(
        [
            LightBar({1,2,3,4,5,6,7}, Bar(["32767","0","0","0"])),
            LightBar({71,72,73,74,75,76,77}, Bar(["32767","0","0","0"])),

            LightBar({16,17,18,19,20,23,27,30,34,37,41,44,48,51,55,58,59,60,61,62}, StaticBar("32767"))
        ]
    )
bars.append([])
generateFile(bars, filePath, 77)
