<div class="source-code-container">

    <h2>Page source code</h2>

    <div id="code" class="source-code"">

        <?php
        $f = basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING']);

        $f = str_replace(".php","",$f);

        // remote file inclusion attempt fix
        if (strtolower($f) == 'index')
            die("File doesn't exist or potential remote file inclusion attempt!");

        if (strpos($f,".")!==false)
            die("File doesn't exist or potential remote file inclusion attempt");
            
        $f = "$f.php";
        if (!file_exists($f))
            die("File doesn't exist or potential remote file inclusion attempt");

        $code = file_get_contents($f);

        // replace db settings with placeholder
        $code = preg_replace('/("hostname"=>")[^"].*"/i','$1HOSTNAME"',$code);
        $code = preg_replace('/("username"=>")[^"].*"/i','$1USERNAME"',$code);
        $code = preg_replace('/("password"=>")[^"]?.*"/i','$1PASSWORD"',$code);

        echo highlight_string($code, true);

        ?>
        
    </div>
</div>



<br /><br />


<div class="footer"><strong>Build-From-Scratch Series</strong> | phpGrid &copy; <?php echo date('Y'); ?>.</div>

<script src="assets/js/main.js" type="text/javascript"></script>
</body>
</html>