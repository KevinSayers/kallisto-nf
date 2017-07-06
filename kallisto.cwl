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
  expFile: File
  expName: string


outputs:
  kallistoResult:
    type: Directory
    outputSource: combine/out
  geneTableResult:
    type: File
    outputSource: sleuth/geneTable
  sleuthObjResult:
    type: File
    outputSource: sleuth/sleuthObj


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
    out: [tsvFile, h5File, jsonFile, sample]
    scatter:
      - read
  organize:
    run: reorder.cwl
    in:
      tsvFile: mapstep/tsvFile
      h5File: mapstep/h5File
      jsonFile: mapstep/jsonFile
      sample: mapstep/sample
    out: [out]
    scatterMethod: dotproduct
    scatter:
      - tsvFile
      - h5File
      - jsonFile
      - sample
  combine:
    run: combine.cwl
    in: 
      folders: organize/out
    out: [out]
  sleuth:
    run: sleuth.cwl
    in:
      dataFolder: combine/out
      experiment: expFile
    out: [geneTable, sleuthObj]

