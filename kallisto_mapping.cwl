cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto

baseCommand: kallisto
arguments: [quant, --single]

inputs:
   fragment_len:
     type: int
     inputBinding:
       prefix: -l
       position: 1
   fragment_sd:
     type: int
     inputBinding:
       prefix: -s
       position: 2
   bootstrap:
     type: int
     inputBinding:
       prefix: -b
       position: 3
   index:
     type: File
     inputBinding: 
       prefix: -i 
       position: 4
   cpus:
     type: int
     default: 2
     inputBinding:
       prefix: -t
       position: 5
   outName:
     type: string
     default: data
     inputBinding:
       prefix: -o
       position: 6
   read:
     type: File
     inputBinding:
       position: 7
outputs:
  outfiles:
    type: File
    outputBinding:
      glob: "data/*.tsv"
  sample:
    type: string
    outputBinding:
      outputEval: ${return String('Test')}




