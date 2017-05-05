cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto


baseCommand: sleuth


inputs:
   dataFolder:
     type: Directory
     inputBinding:
       position: 1

   experiment:
     type: File
     inputBinding:
       position: 2

outputs:
  index:
    type: Directory
    outputBinding:
       glob: .
