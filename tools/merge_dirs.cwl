#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["rsync", "-a"]
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
    "dirs_additional":
        type: Directory[]?
    "outdir":
        type: string
        default: "merge_dirs_out"
        inputBinding:
            position: 3
    
arguments:
    - position: 1
      valueFrom: |
        ${
            function add_slash(x){
                return x["path"] + "/" ;
            }
            return inputs.dirs.map(add_slash) ;
        }
    - position: 2
      valueFrom: |
        ${
            function add_slash(x){
                return x["path"] + "/" ;
            }
            return inputs.dirs_additional.map(add_slash) ;
        }
outputs:
    "output_dir":
        type: Directory
        outputBinding:
            glob: $(inputs.outdir)
