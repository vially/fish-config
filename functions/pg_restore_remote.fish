function pg_restore_remote
    set -l host $argv[1]
    set -l db_name $argv[2]
    echo "Remote database: $host/$db_name"
    set -l dump_file (mktemp --tmpdir)
    echo "Dumping database to $dump_file"
    ssh $host "pg_dump -Fc $db_name" > $dump_file
    echo "Restoring database from dump file"
    dropdb $db_name
    createdb $db_name
    pg_restore -d $db_name $dump_file
end
