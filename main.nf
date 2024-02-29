#!/usr/bin/env nextflow

import groovy.json.JsonBuilder
// Declare syntax version
nextflow.enable.dsl=2

if (params.mode == "qc") {
    include { MONDRIAN_QC_PIPELINE } from './workflows/mondrian_qc'
} else if (params.mode == "inferhaps") {
    include { MONDRIAN_INFERHAPS_PIPELINE } from './workflows/mondrian_inferhaps'
}


workflow MONDRIAN {
    if(params.mode == "qc") {
        MONDRIAN_QC_PIPELINE ()
    }
    else if(params.mode == "inferhaps") {
        MONDRIAN_INFERHAPS_PIPELINE ()
    }
}


/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    RUN ALL WORKFLOWS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
//
workflow {
    MONDRIAN()
}

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    THE END
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
