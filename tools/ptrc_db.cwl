#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["DB"]
hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/ptrc
        dockerFile:
            $include: ../containers/PTRC/Dockerfile
inputs:
    "metadata":
        type: File?
        inputBinding:
            position: 1
            prefix: "-metadata"
    "fasta":
        type: File
        inputBinding:
            position: 2
            prefix: "-fasta"
    "out":
        type: string
        inputBinding:
            position: 3
            prefix: "-out"

outputs:
    "output_db":
        type: File[]
        outputBinding:
            glob: $(inputs.out).*
