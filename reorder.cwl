cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement
inputs:
  tsvFile:
    type: File
  h5File:
    type: File
  jsonFile:
    type: File
  sample:
    type: string
outputs:
  out: Directory
expression: |
  ${
    return {"out": {
      "class": "Directory", 
      "basename": String(inputs.sample),
      "listing": [inputs.tsvFile, inputs.h5File, inputs.jsonFile]
    } };
  }