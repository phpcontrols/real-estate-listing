<div id="menu">
    <ul>
        <li><a href="home.php" <?php if($_GET['currentPage'] == 'home') echo 'class="active"'; ?>>Home</a></li>
        <li><a href="broker.php" <?php if($_GET['currentPage'] == 'broker') echo 'class="active"'; ?>>Broker</a></li>
        <li><a href="inquiries.php" <?php if($_GET['currentPage'] == 'inquiries') echo 'class="active"'; ?>>Inquiries</a></li>
        <li><a href="agents.php" <?php if($_GET['currentPage'] == 'agents') echo 'class="active"'; ?>>Agents</a></li>
        <span style="float:right;"><li><a href="logout.php">Logout</a></li></span>

    </ul>
</div>