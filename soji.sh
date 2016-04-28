alias move-to-space='cd /data/Dropbox/StitchFix/Experiments/move-to-space/'
alias eng-notebook='pushd /data/Dropbox/Notes && vi engineering-notebook-`date +%Y-%m-%d`.md && popd'

function note {
  if [ $# -eq 0 ]; then
   pushd /data/Dropbox/Notes && vi note-`date +%Y-%m-%d-at-%H:%M`.md && popd
  else
   pushd /data/Dropbox/Notes && vi $1.md && popd
  fi
}

function zazen {
  for i in {1..10}; do
    echo "☸ "
    sleep 30s
  done
}

function heart_sutra {
  text="Av a lo kit e sh var a Bod hi satt va, when deep ly prac tic ing praj ña par a mit a, clear ly saw 
  that all five agg re gates are emp ty and thus re lieved all suf fer ing. Shar i put ra, form 
does not dif fer from empt i ness, empt i ness does not dif fer from form. Form it self is 
empt i ness, empt i ness it self form. Sen sat ions, per cept ions, form at ions, and 
con scious ness are al so like this. Shar i put ra, all dharm as are marked by empt i ness; 
they neith er a rise nor cease, are neith er de fil ed nor pure, neith er in crease nor 
de crease. There fore, giv en empt i ness, there is no form, no sen sat ion, no per cept ion, 
no form at ion, no consciousness; no eyes, no ears, no nose, no tongue, no bo dy, no 
mind; no sight, no sound, no smell, no taste, no touch, no ob ject of mind; 
no realm of sight ... no realm of mind con scious ness. There is neith er ig nor ance nor 
ex tinct ion of ig nor ance... neith er old age and death, nor ex tinct ion of old age and 
death; no suff er ing, no cause, no cess at ion, no path; no knowl edge and no 
at tain ment. With noth ing to at tain, a bod hi satt va re lies on praj ña par a mit a, and thus 
the mind is with out hind rance. With out hind rance, there is no fear. Far bey ond all 
in vert ed views, one real iz es nir van a. All budd has of past, pres ent, and fut ure re ly 
on praj ña par a mit a and there by at tain un sur passed, com plete, per fect 
en light en ment. There fore, know the praj ña par a mit a as the great mir ac u lous 
mant ra, the great bright man tra, the su preme man tra, the in comp ar ab le man tra, 
which re moves all suff er ing and is true, not false
. There fore we pro claim the praj ña par a mit a man tra, the man tra that says: Ga te Ga te Par a gate Para sam gate Bod hi Sva ha."

 echo
 for word in $text; do
   echo -ne "\e[41m\e[37m$word \e[0m"
   sleep 0.5
   if [[ $word == *'.'* ]]; then
     echo
   fi
 done
 echo
}

function soji_start {
  echo "start,$1,`date +'%s'`" >> /data/Dropbox/soji/events-`date +%Y-%m-%d`.csv
  echo -e "\n### Pom -- $1 -- `date +'%I:%M%p'`" >> "/data/Dropbox/Notes/engineering-notebook-`date +%Y-%m-%d`.md"
}

function soji_break {
  echo "break,break,`date +'%s'`" >> /data/Dropbox/soji/events-`date +%Y-%m-%d`.csv
}

function soji_status {
  todays_data_file_path="/data/Dropbox/soji/events-$(date +%Y-%m-%d).csv"
  if [ -e $todays_data_file_path ]; then
    task=`cat $todays_data_file_path | egrep "^(start|break)" | tail -1 |awk -F, '{print $2}'`
    start_time=`cat $todays_data_file_path | egrep "^(start|break)" | tail -1 | awk -F, '{print $3}'`
    seconds=`expr $(date +'%s') - $start_time`
    minutes=`expr $seconds / 60`
    echo "$task -- $minutes min"
  fi
}

function soji_report {
  todays_note_file="/data/Dropbox/Notes/engineering-notebook-`date +%Y-%m-%d`.md"
  if [ -e $todays_note_file ]; then
    poms=`cat $todays_note_file | grep "### Pom" | wc -l`
    echo
    echo "Today you did $poms Pomodoros"
    echo
  fi
}
