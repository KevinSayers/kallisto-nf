cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto


baseCommand: kallisto
arguments: [index]

inputs:
   fileName:
     type: string
     inputBinding:
       prefix: -i
       position: 1

   transcriptome:
     type: File
     inputBinding:
       position: 2

outputs:
  index:
    type: File
    outputBinding:
       glob: $(inputs.fileName)
