cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement
inputs:
  outfiles:
    type:
      type: array
      items: File
  sample: string[]
outputs:
  out: Directory
expression: |
  ${
    return {"out": {
      "class": "Directory", 
      "basename": inputs.sample,
      "listing": [inputs.outfiles]
    } };
  }