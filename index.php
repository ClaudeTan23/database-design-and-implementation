<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Portal</title>
    <style>
        * {
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            margin: 0 0;
        }

        body {
            font-family: Helvetica;
            -webkit-font-smoothing: antialiased;
            background: rgba(71, 147, 227, 1);
        }

        h2 {
            text-align: center;
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: white;
            padding: 30px 0;
        }

        /* Table Styles */

        .table-wrapper {
            box-shadow: 0px 35px 50px rgba(0, 0, 0, 0.2);
            width: 100%;
        }

        .fl-table {
            border-radius: 5px;
            font-size: 12px;
            font-weight: normal;
            border: none;
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            white-space: nowrap;
            background-color: white;
        }

        .fl-table td,
        .fl-table th {
            text-align: center;
            padding: 15px;
            font-size: 20px;
        }

        .fl-table td {
            border-right: 1px solid #f8f8f8;
            font-size: 12px;
        }

        .fl-table thead th {
            color: #ffffff;
            background: #4FC3A1;
        }


        .fl-table thead th {
            color: #ffffff;
            background: #324960;
        }
    </style>
</head>

<body>
    <?php

    $sqlUsername = "root";
    $sqlPassword = "";
    $database    = "community_portal";
    $sqlServer      = "127.0.0.1";

    $conn = new mysqli($sqlServer, $sqlUsername, $sqlPassword, $database);

    if ($conn->connect_error) 
    {
        die("connection_fail" . $conn->connect_error);
    }

    $table = "user";

    if (isset($_POST["table"]) && !empty($_POST["table"])) $table = $_POST["table"];


    $query = "SELECT * FROM " . $table;
    $mysql = $conn->query($query, MYSQLI_STORE_RESULT);
    $data  = $mysql->fetch_all(MYSQLI_NUM);

    $tableQuery = "SHOW TABLES FROM " . $database;
    $tableSql = $conn->query($tableQuery);

    ?>

    <h2>Database Query Data Table</h2>

    <div style="padding: 10px; width: 100%; display: flex; justify-content: left; align-items: center;">
        <div style="display: flex; align-items: center;">
            <label for="table" style="color: #fff; font-size: 16px; font-weight: bold; padding: 0 10px;">Table: </label>
            <form action="/community/index.php" method="POST" id="form">
                <select name="table" id="table" style="padding: 6px 10px; border-radius: 4px; border: none; font-size: 14px; background-color: #f8f8f8;" onchange="query()">
                    <?php while ($row = $tableSql->fetch_array()) { ?>
                        <option <?php if($row['Tables_in_community_portal'] == $table) { ?> selected <?php } ?> value="<?= $row['Tables_in_community_portal'] ?>"><?= $row['Tables_in_community_portal'] ?></option>
                    <?php } ?>
                </select>
            </form>
        </div>
    </div>

    <div class="table-wrapper">
        <table class="fl-table">
            <thead>
                <tr>
                    <?php while ($rowColumn = $mysql->fetch_field()) { ?>
                        <th><?= $rowColumn->name ?></th>
                    <?php } ?>
                </tr>
            </thead>
            <tbody>
                <?php for ($i = 0; $i < count($data); $i++) { ?>
                    <tr>
                        <?php for ($n = 0; $n < count($data[$i]); $n++) { ?>
                            <td><?= $data[$i][$n] ?></td>
                        <?php } ?>
                    </tr>
                <?php } ?>
            <tbody>
        </table>
    </div>
<script>
    const query = () => 
    {
        document.getElementById("form").submit();
    }
</script>
</body>

</html>