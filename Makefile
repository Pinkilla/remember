#
# Example of usage : first time you call make, value is needed (and we do
# nothing with it) after, the value is memorized fos a while. 
# 
#


example:
	@echo  "$(shell ./remember.sh somelogin)" > /dev/null
	@echo "First time you give value, second time no…"