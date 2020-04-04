#! /bin/bash
userid="b0213483"
targets=(~/Lab 
	 ~/.ssh 
	 ~/Documents 
	 ~/Downloads
	 ~/Desktop
	 ~/Pictures
	 ~/Postman
	 ~/putty*
	 ~/Softwares 
	 /lab 
	 ~/Library/Caches/Google 
	 ~/Library/Caches/Firefox 
	 ~/Library/Caches/Mozilla
	)

dry_run() {
  for dir in ${targets[@]}; do
    echo "* Will nuke $dir"
    ls $dir
  done
}

nuke() {
  echo "Are you sure you want to nuke? Confirm with OLM ID: "
  read olm_id
  olm_id=$(tr "[A-Z]" "[a-z]" <<< $olm_id)
  if [ $olm_id != $userid ]; then
    echo 'No can do'
  else
    echo 'Okay then.'
    echo "Nuking in..."
    for s in {5..1}; do
      echo $s
      sleep 1
    done
    for dir in ${targets[@]}; do
      echo "* Nuking $dir"
      rm -rf $dir
    done
  fi
  echo "Boom."
}

# Comment this and uncomment nuke to do it for real
dry_run
# nuke
