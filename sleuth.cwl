cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: ktest/sleuth

requirements:
  - class: InlineJavascriptRequirement


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

outputs:
   geneTable:
     type: File
     outputBinding:
       glob: "gene_table_results.txt"
   sleuthObj:
     type: File
     outputBinding:
       glob: "sleuth_object.so"

   
   