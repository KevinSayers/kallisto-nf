inDir = file('kallisto/')
exp = file('tutorial/experiment/hiseq_info.txt')
process sleuth {
    input:
    file kali from inDir
    file exp_file from exp

    output: 
    file 'sleuth_object.so'
    file 'gene_table_results.txt'

    script:
    //
    // Setup sleuth R dependancies and environment
    //
 
    """
    sleuth.R kallisto ${exp_file}
    """
}