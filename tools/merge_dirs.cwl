#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["-a"]
requirements:
    InlineJavascriptRequirement: {}
hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/rsync
        dockerFile:
            $include: ../containers/rsync/Dockerfile
inputs:
    "dirs":
        type: Directory[]
    "outdir":
        type: string
        default: "merge_dirs_out"
        inputBinding:
            position: 2
    
arguments:
    - position: 1
      valueFrom: |
        ${
            function add_slash(x){
                return x["path"] + "/" ;
            }
            return inputs.dirs.map(add_slash) ;
        }
outputs:
    "output_dir":
        type: Directory
        outputBinding:
            glob: $(inputs.outdir)