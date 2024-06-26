<?php include 'header.php'; ?>
<?php mysqli_query($koneksi,"delete from tmp_kecocokan"); ?>

<header id="header" class="ex-header" style="padding-top: 8rem;padding-bottom: 2rem;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Data Pakar</h1>
            </div>
        </div>
    </div>
</header>

<div class="container">

    <!-- Data Gejala Section -->
    <div class="card mt-4" id="gejala-section">
        <div class="card-header">
            <h4 class="card-title m-0">Data Gejala</h4>
            <button onclick="printSection('gejala-section')" class="btn btn-primary">Print Data Gejala</button>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="1%">No</th>
                        <th width="15%">Inisial</th>
                        <th>Nama Gejala</th>                  
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1; 
                    $data = mysqli_query($koneksi,"select * from gejala");    
                    while($d=mysqli_fetch_array($data)){
                        ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $d['gej_inisial'] ?></td>
                            <td><?php echo $d['gej_nama'] ?></td>                   
                        </tr>
                        <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Data Alternatif Section -->
    <div class="card mt-4">
    <div class="card-header">
        <h4 class="card-title m-0">Data Alternatif/Kerusakan</h4>
        <button onclick="printDiv('printAlternatif')" class="btn btn-primary">Print Data Alternatif</button>
    </div>
    <div class="card-body" id="printAlternatif">
        <table class="table table-bordered">            
            <tr>
                <th width="1%">No</th>
                <th width="1%">Inisial</th>
                <th width="20%">Nama Alternatif</th>   
                <th width="30%">Penyebab</th>   
                <th width="30%">Solusi</th>               
            </tr>
            <?php
            $no = 1; 
            $data = mysqli_query($koneksi,"select * from alternatif");   
            while($d=mysqli_fetch_array($data)){
                ?>
                <tr>
                    <td><?php echo $no++; ?></td>
                    <td><?php echo $d['alt_inisial'] ?></td>
                    <td><?php echo $d['alt_nama'] ?></td>     
                    <td><?php echo $d['alt_penyebab'] ?></td>     
                    <td><?php echo $d['alt_solusi'] ?></td>                 
                </tr>
                <?php
            }
            ?>
        </table>
    </div>
</div>


    <!-- Data Relasi Section -->
    <div class="card mt-4">
    <div class="card-header">
        <h4 class="card-title m-0">Data Relasi</h4>
        <button onclick="printDiv('printRelasi')" class="btn btn-primary">Print Data Relasi</button>
    </div>
    <div class="card-body" id="printRelasi">
        <p>Data relasi antara Kerusakan(alternatif) dan gejala(kriteria).</p>
        <div class="table-responsive">
            <table class="table table-bordered" border="1" style="width: 100%;">   
                <tr>      
                    <th width="1%">No</th>
                    <th width="40%">ALTERNATIF</th>
                    <?php
                    $kriteria = mysqli_query($koneksi,"select * from gejala");    
                    while($k=mysqli_fetch_array($kriteria)){
                        ?>
                        <th width="1%"><?php echo $k['gej_inisial'] ?></th>          
                        <?php
                    }
                    ?>      
                </tr>
                <?php
                $no = 1;
                $alternatif = mysqli_query($koneksi,"select * from alternatif");    
                while($ker=mysqli_fetch_array($alternatif)){
                    $a=$ker['alt_id'];

                    ?>
                    <tr>
                        <td><?php echo $no++ ?></td>
                        <td>(<?php echo $ker['alt_inisial'] ?>) <?php echo $ker['alt_nama'] ?></td>
                        <?php 
                        $g = mysqli_query($koneksi,"select * from gejala");   
                        while($ge=mysqli_fetch_array($g)){
                            $b = $ge['gej_id'];
                            ?>
                            <td>
                            <?php       
                                $kecocokan = mysqli_query($koneksi, "select * from kecocokan where kecocokan.kec_alternatif='$a' and kecocokan.kec_gejala='$b'");
                                $ke = mysqli_fetch_array($kecocokan);
                                if (isset($ke['kec_nilai']) && $ke['kec_nilai'] == "1") {
                                    echo "1";
                                } else {
                                    echo "-";
                                }
                            ?>
                            </td>   
                        <?php } ?>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>

<script>
    function printSection(sectionId) {
        var printContent = document.getElementById(sectionId).innerHTML;
        var originalContent = document.body.innerHTML;
        document.body.innerHTML = printContent;
        window.print();
        document.body.innerHTML = originalContent;
    }
</script>

<script>
function printDiv(divId) {
    var divToPrint = document.getElementById(divId).innerHTML;
    var myWindow = window.open('', '', 'width=800,height=600');
    myWindow.document.write('<html><head><title>Print</title>');
    myWindow.document.write('<style>');
    myWindow.document.write('table {width: 100%; border-collapse: collapse;}');
    myWindow.document.write('table, th, td {border: 1px solid black;}');
    myWindow.document.write('th, td {padding: 8px; text-align: left;}');
    myWindow.document.write('</style>');
    myWindow.document.write('</head><body>');
    myWindow.document.write(divToPrint);
    myWindow.document.write('</body></html>');
    myWindow.document.close();
    myWindow.print();
}
</script>

<script>
function printDiv(divId) {
    var divToPrint = document.getElementById(divId).innerHTML;
    var myWindow = window.open('', '', 'width=800,height=600');
    myWindow.document.write('<html><head><title>Print</title>');
    myWindow.document.write('<style>');
    myWindow.document.write('@media print { @page { size: landscape; } }');
    myWindow.document.write('table {width: 100%; border-collapse: collapse;}');
    myWindow.document.write('table, th, td {border: 1px solid black;}');
    myWindow.document.write('th, td {padding: 8px; text-align: left;}');
    myWindow.document.write('</style>');
    myWindow.document.write('</head><body>');
    myWindow.document.write(divToPrint);
    myWindow.document.write('</body></html>');
    myWindow.document.close();
    myWindow.print();
}
</script>



<style>
    @media print {
        body * {
            visibility: hidden;
        }
        #gejala-section, #alternatif-section, #relasi-section {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
        }
    }

    @media print {
    body * {
        visibility: hidden;
    }
    #printAlternatif, #printAlternatif * {
        visibility: visible;
    }
    #printAlternatif {
        position: absolute;
        left: 0;
        top: 0;
    }
}

@media print {
    body * {
        visibility: hidden;
    }
    #printRelasi, #printRelasi * {
        visibility: visible;
    }
    #printRelasi {
        position: absolute;
        left: 0;
        top: 0;
    }
    @page {
        size: landscape;
    }
}
</style>
