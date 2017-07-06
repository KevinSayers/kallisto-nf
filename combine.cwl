cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement
inputs:
  folders: Directory[]
outputs:
  out: Directory
expression: |
  ${
    return {"out": {
      "class": "Directory", 
      "basename": String("kallisto"),
      "listing": [inputs.folders[0],inputs.folders[1],inputs.folders[2],inputs.folders[3],inputs.folders[4], inputs.folders[5]]
    } };
  }