#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["CA"]
requirements:
    InlineJavascriptRequirement: {}
hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/ptrc
        dockerFile:
            $include: ../containers/PTRC/Dockerfile
inputs:
    "pe":
        type: boolean
        default: false
        inputBinding:
            position: 1
            prefix: "-pe"
    "i1":
        type: File?
        inputBinding:
            position: 2
            prefix: "-i1"
    "i2":
        type: File?
        inputBinding:
            position: 3
            prefix: "-i2"
    "map":
        type: string?
    "gz":
        type: boolean?
        default: false
        inputBinding:
            position: 5
            prefix: "-gz"
    "qual_format":
        type: string?
        inputBinding:
            position: 6
            prefix: "-qual_format"
    "outfol":
        type: string?
        default: "ptrc_ca_out"
        inputBinding:
            position: 7
            prefix: "-outfol"
    "db_dir_path":
        type: Directory
    "db_name":
        type: string
arguments:
    - prefix: "-db_path_name"
      position: 8
      valueFrom: $(inputs.db_dir_path.path)/$(inputs.db_name)
    - prefix: "-m"
      position: 4
      valueFrom: |
        ${
            if (!inputs.map){
                return inputs.i1.nameroot + ".map" ;
            }else{
                return inputs.map ;
            }
        }
outputs:
    "output_dir":
        type: Directory
        outputBinding:
            glob: $(inputs.outfol)
