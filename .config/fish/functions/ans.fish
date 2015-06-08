function ans --description='Sets up Ansible and it\'s environment'

    if test -z $ANSIBLE_PATH
        echo "ANSIBLE_PATH variable needs to be set"
        exit -1
    end

    set HACKING_DIR $ANSIBLE_PATH/hacking

    # The below is an alternative to readlink -fn which doesn't exist on OS X
    # Source: http://stackoverflow.com/a/1678636
    set FULL_PATH (python -c "import os; print(os.path.realpath('$HACKING_DIR'))")
    set ANSIBLE_HOME (dirname $FULL_PATH)

    set ANSIBLE_HOME $ANSIBLE_PATH

    set PREFIX_PYTHONPATH $ANSIBLE_HOME/lib
    set PREFIX_PATH $ANSIBLE_HOME/bin
    set PREFIX_MANPATH $ANSIBLE_HOME/docs/man

    if not contains $PREFIX_PYTHONPATH $PYTHONPATH
        set -gx PYTHONPATH $PREFIX_PYTHONPATH $PYTHONPATH
    end

    if not contains $PREFIX_PATH $PATH
        set -gx PATH $PREFIX_PATH $PATH
    end

    set -u ANSIBLE_LIBRARY
    set -gx ANSIBLE_LIBRARY $ANSIBLE_HOME/library (python $HACKING_DIR/get_library.py)
    if not contains $PREFIX_MANPATH $MANPATH
       set -gx MANPATH $PREFIX_MANPATH $MANPATH
   end

end
