#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["PTR"]
hints:
    DockerRequirement:
        dockerPull: ajhjhaf/ptrc:1.1.2
        dockerImageId: ajhjhaf/ptrc:1.1.2
        dockerFile:
            $include: ../containers/PTRC/Dockerfile
inputs:
    "infol":
        type: Directory
        inputBinding:
            position: 1
            prefix: "-infol"
    "minpred":
        type: int?
        default: 1
        inputBinding:
            position: 2
            prefix: "-minpred"
    "preds":
        type: string?
        inputBinding:
            position: 3
            prefix: "-preds"
    "out":
        type: string?
        default: "ptrc_ptr_out.csv"
        inputBinding:
            position: 4
            prefix: "-o"
    "opreds":
        type: string?
        inputBinding:
            position: 5
            prefix: "-opreds"
    "csv_output":
        type: boolean?
        inputBinding:
            position: 6
            prefix: "-csv_output"
    "db_dir_path":
        type: Directory
    "db_name":
        type: string
    "cov_thresh": 
        type: float?
        inputBinding:
            position: 9
            prefix: "-cov_thresh"
arguments:
    - prefix: "-db_path_name"
      position: 8
      valueFrom: $(inputs.db_dir_path.path)/$(inputs.db_name)
outputs:
    "output_file":
        type: File
        outputBinding:
            glob: $(inputs.out)
    "output_file_preds":
        type: File?
        outputBinding:
            glob: $(inputs.opreds)
