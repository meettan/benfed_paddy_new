<style>
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid #dddddd;

    padding: 6px;

    font-size: 12px;
}

th {

    text-align: center;

}

tr:hover {background-color: #f5f5f5;}

</style>

<script>
  function printDiv() {

        var divToPrint = document.getElementById('divToPrint');

        var WindowObject = window.open('', 'Print-Window');
        WindowObject.document.open();
        WindowObject.document.writeln('<!DOCTYPE html>');
        WindowObject.document.writeln('<html><head><title></title><style type="text/css">');


        WindowObject.document.writeln('@media print { .center { text-align: center;}' +
            '                                         .inline { display: inline; }' +
            '                                         .underline { text-decoration: underline; }' +
            '                                         .left { margin-left: 315px;} ' +
            '                                         .right { margin-right: 375px; display: inline; }' +
            '                                          table { border-collapse: collapse; font-size: 12px;}' +
            '                                          th, td { border: 1px solid black; border-collapse: collapse; padding: 6px;}' +
            '                                           th, td { }' +
            '                                         .border { border: 1px solid black; } ' +
            '                                         .bottom { bottom: 5px; width: 100%; position: fixed ' +
            '                                       ' +
            '                                   } } </style>');
        WindowObject.document.writeln('</head><body onload="window.print()">');
        WindowObject.document.writeln(divToPrint.innerHTML);
        WindowObject.document.writeln('</body></html>');
        WindowObject.document.close();
        setTimeout(function () {
            WindowObject.close();
        }, 10);

  }
</script>


<?php

  //  if($_SERVER['REQUEST_METHOD'] == 'GET') {

?>        
<!-- <div class="wraper">      
 <div class="col-md-3 container"></div>
        <div class="col-md-6 container form-wraper">
    
            <form method="POST" id="form" action="<?php //echo site_url("payment/annexture10");?>">

                <div class="form-header">
                
                    <h4>Annexure Report</h4>
                
                </div>

                <div class="form-group row">

                    <label for="dist" class="control-lebel col-sm-2 col-form-label">Select District:</label>

                        <div class="col-sm-10">

                            <select
                                class="form-control required"
                                name="dist"
                                id="dist">

                                <option value="">Select District</option>

                                <?php foreach($dist as $dis) {?>

                                    <option value="<?php echo $dis->district_code ?>" ><?php echo $dis->district_name; ?></option>

                                <?php
                                }
                                ?>

                            </select>   

                        </div>

                </div>

                <div class="form-group row">

                    <div class="col-sm-10">

                        <input type="submit" class="btn btn-info" value="Proceed" />

                    </div>

                </div>

            </form>    

        </div>

    </div> -->        

    <?php

 //   }
    
  //  else if($_SERVER['REQUEST_METHOD'] == 'POST') { 
        
    ?>

        <div class="wraper"> 

                  <div class="row">
            
            <div class="col-lg-9 col-sm-12">

                <h1><strong>Annexure X</strong></h1>

            </div>

        </div>

        <div class="col-lg-12 container contant-wraper">   
        </br> 

            <table class="table table-bordered table-hover">

                <thead>

                    <tr>
                        
                        <th>Payment No.</th>
                        <th>Date</th>
                        <th>Bill Number</th>
                        <th>Option</th>

                    </tr>

                </thead>

                <tbody> 

                    <?php 
                    
                    if(isset($bill_dtls)) {

                        foreach($bill_dtls as $bill_dtl) {

                    ?>

                            <tr>

                                <td><?php echo $bill_dtl->pmt_bill_no; ?></td>
                                <td><?php echo date('d-m-Y', strtotime($bill_dtl->trans_dt)); ?></td>
                                <td><?php echo $bill_dtl->ho_bill_number; ?> </td>
                             
                                <td>
                                
                                    <a href="<?php echo base_url();?>index.php/payment/annexture10_print?pmt_bill_no=<?php echo $bill_dtl->pmt_bill_no; ?>/<?php echo $bill_dtl->dist; ?>/<?php echo $bill_dtl->kms_id; ?>" 
                                        data-toggle="tooltip"
                                        data-placement="bottom" 
                                        title="Print">

                                        <i class="fa fa-print fa-2x" style="color: #007bff"></i>
                                        
                                    </a>
                                    
                                </td>

                            </tr>

                    <?php
                            
                            }

                        }

                        else {

                            echo "<tr><td colspan='10' style='text-align: center;'>No data Found</td></tr>";

                        }
                    ?>
                
                </tbody>

                <tfoot>

                    <tr>
                    
                        <th>Payment No.</th>
                        <th>Date</th>
                        <th>Bill Number</th>
                      
                        <th>Option</th>

                    </tr>
                
                </tfoot>

            </table>
            
        </div>
            
        </div>
        
    <?php

//    }

    ?> 