from Bar import *
from Generate import *

filePath = "./lights/Cradles/"

bars = []
bars.append(
        [
            LightBar({1,2}, StaticBar("2"))
        ]
    )
bars.append(
        [
            LightBar({2}, StaticBar("22")),
            LightBar({3}, StaticBar("11"))
        ]
    )
generateFile(bars, filePath, 77)
