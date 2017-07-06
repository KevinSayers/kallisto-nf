cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

inputs:
  inFile:
    type: File

outputs:
  outFolder:
    type: Directory
    outputBinding:
      basename: "test"
      listing: [$(inputs.inFile)]