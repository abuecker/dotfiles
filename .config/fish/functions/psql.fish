function psql
    if test -e /opt/homebrew/opt/libpq/bin/psql
        set PSQL_PATH /opt/homebrew/opt/libpq/bin/psql
    end

    PAGER='nvim -R -c "set syntax=dbout" -' $PSQL_PATH $argv
end
