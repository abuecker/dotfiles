function psql
    set PSQL_PATH $(brew --prefix)/opt/libpq/bin/psql
    PAGER='nvim -R -c "set syntax=dbout" -' $PSQL_PATH $argv
end
