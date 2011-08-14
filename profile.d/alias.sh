storage() {
    cd $DEVSTORAGE
    return $?
}

srcdir() {
    cd $DEVSOURCE$1
    return $?
}


site() {
	cd $DEVSOURCE"/sites/"$1
	return $?
}

sites() {
    site
    return $?
}
