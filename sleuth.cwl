cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: cbcrg/kallisto-nf@sha256:9f840127392d04c9f8e39cb72bcd62ff53cfe0492dde02dc3749bf15f1c547f1


requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.dataFolder)
      - $(inputs.experiment)

baseCommand: sleuth.R


inputs:
   dataFolder:
     type: Directory
   dataName:
     type: string
     inputBinding:
       position: 1

   experiment:
     type: File
     inputBinding:
       position: 2

outputs: []
