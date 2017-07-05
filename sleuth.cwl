cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: ktest/sleuth

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.sleuthenv)

baseCommand: [sleuth.R]


inputs:
   dataFolder:
     type: Directory
     inputBinding:
       position: 1
   experiment:
     type: File
     inputBinding:
       position: 2

outputs: []