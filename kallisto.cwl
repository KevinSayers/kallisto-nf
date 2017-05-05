cwlVersion: v1.0
class: Workflow

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto

requirements:
  - class: ScatterFeatureRequirement

inputs:
  fileName: string
  transcriptome: File
  bootstrap: int
  fragment_len: int
  fragment_sd: int
  read: File[]


outputs:
  index:
    type: File
    outputSource: indexstep/index
  map:
    type: Directory[]
    outputSource: mapstep/outdir

steps:
  indexstep:
    run: kallisto_index.cwl
    in: 
      fileName: fileName
      transcriptome: transcriptome
    out: [index]
  mapstep:
    run: kallisto_mapping.cwl
    in:
      bootstrap: bootstrap
      fragment_len: fragment_len
      fragment_sd: fragment_sd
      index: indexstep/index
      read: read
    out: [outdir]
    scatter:
      - read
    



