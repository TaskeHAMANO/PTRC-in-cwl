#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
    ScatterFeatureRequirement: {}

inputs:
    i1: File[]
    db_dir_path: Directory
    db_name: string
    cov_thresh: float?
    out: string?
steps:
    ptrc_ca:
        run: "../tools/ptrc_ca.cwl"
        scatter:
            - i1
        scatterMethod: dotproduct
        in:
            i1: i1
            db_dir_path: db_dir_path
            db_name: db_name
            cov_thresh: cov_thresh
        out:
            - output_dir
    merge_dirs:
        run: "../tools/merge_dirs.cwl"
        in:
            dirs: ptrc_ca/output_dir
        out:
            - output_dir
    ptrc_ptr:
        run: "../tools/ptrc_ptr.cwl"
        in:
            infol: merge_dirs/output_dir
            db_dir_path: db_dir_path
            db_name: db_name
            csv_output: {"default": true}
            cov_thresh: cov_thresh
            out: out
        out:
            - output_file

outputs:
    ptr_file:
        type: File
        outputSource: ptrc_ptr/output_file