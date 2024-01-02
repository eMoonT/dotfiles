dwm_week(){
	date | awk '{print $4}' | trans :ja | awk 'NR==4{print $0}' | grep -Pv "[\x80-\xFF]"
}
