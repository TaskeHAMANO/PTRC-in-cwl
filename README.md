# PTRC-in-cwl

Peak-to-Trough-Rate Calculater wrapped by CWL

## Requirements

* cwl-runner such as [cwltool](https://github.com/common-workflow-language/cwltool)
* Docker
    * If you cannot use docker, this tool runs with `--no-container` options.
    * However, you have to install dependent tools of RaGOO, such as python2, numpy, and so on
* PTRC
    * You can download this software from [Prof. Segal's lab page](https://genie.weizmann.ac.il/software/bac_growth.html)
    * After donloaded, please place PTRC1.1.2.tar.gz to `containers/PTRC`

## How to use

With the [CWL reference implementation](https://github.com/common-workflow-language/cwltool/) (`cwltool`), [`toil-cwl-runner`](https://toil.readthedocs.io/en/latest/running/cwl.html), or [`arvados-cwl-runner`](https://dev.arvados.org/projects/arvados/wiki/Running_Common_Workflow_Language_%28CWL%29_workflows_on_Arvados) as your `cwl-runner`:

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           workflows/ptrc_pipeline_se.cwl \
           --i1 ${PATH_TO_FASTQ_FILE1} \
           --i1 ${PATH_TO_FASTQ_FILE2} \
           ...
           --db_dir_path ${PATH_TO_DIRECTORY_WHICH_CONTAINS_INDEX_FILES}
           --db_name  ${INDEX_NAME} \
```

For other runners an input object is required:
> inputs.yml
```
i1:
  - class: File
    path: path/to/file1
  - class: File
    path: path/to/file1
db_dir_path:
  class: Directory
  path: path/to/directory/which/contains/index/files
db_name: index_name
```

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           workflows/ptrc_pipeline_se.cwl \
           inputs.yml
```

## Reference

Original PTRC inplementation was published from [(Korem et al., Science, 2015)](http://doi.org/10.1126/science.aac4812).
And this implementation was part of [Suzuki et al., Submitted]().