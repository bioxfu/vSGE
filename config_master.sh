# add yourself to the manager list
sudo qconf -am $USER

# add yourself to the operator list (will be able to add/remove workers)
sudo qconf -ao $USER

# change scheduler config
cat > ./grid <<EOL
algorithm                         default
schedule_interval                 0:0:1
maxujobs                          0
queue_sort_method                 load
job_load_adjustments              np_load_avg=0.50
load_adjustment_decay_time        0:7:30
load_formula                      np_load_avg
schedd_job_info                   true
flush_submit_sec                  0
flush_finish_sec                  0
params                            none
reprioritize_interval             0:0:0
halftime                          168
usage_weight_list                 cpu=1.000000,mem=0.000000,io=0.000000
compensation_factor               5.000000
weight_user                       0.250000
weight_project                    0.250000
weight_department                 0.250000
weight_job                        0.250000
weight_tickets_functional         0
weight_tickets_share              0
share_override_tickets            TRUE
share_functional_shares           TRUE
max_functional_jobs_to_schedule   200
report_pjob_tickets               TRUE
max_pending_tasks_per_job         50
halflife_decay_list               none
policy_hierarchy                  OFS
weight_ticket                     0.500000
weight_waiting_time               0.278000
weight_deadline                   3600000.000000
weight_urgency                    0.500000
weight_priority                   0.000000
max_reservation                   0
default_duration                  INFINITY
EOL
sudo qconf -Msconf ./grid
rm ./grid

# create a host list
echo -e "group_name @allhosts\nhostlist NONE" > ./grid
sudo qconf -Ahgrp ./grid
rm ./grid

# create a queue
cat > ./grid <<EOL
qname                 bioinfo.q
hostlist              @allhosts
seq_no                0
load_thresholds       NONE
suspend_thresholds    NONE
nsuspend              1
suspend_interval      00:00:01
priority              0
min_cpu_interval      00:00:01
processors            UNDEFINED
qtype                 BATCH INTERACTIVE
ckpt_list             NONE
pe_list               make
rerun                 FALSE
slots                 2
tmpdir                /tmp
shell                 /bin/csh
prolog                NONE
epilog                NONE
shell_start_mode      posix_compliant
starter_method        NONE
suspend_method        NONE
resume_method         NONE
terminate_method      NONE
notify                00:00:01
owner_list            NONE
user_lists            NONE
xuser_lists           NONE
subordinate_list      NONE
complex_values        NONE
projects              NONE
xprojects             NONE
calendar              NONE
initial_state         default
s_rt                  INFINITY
h_rt                  INFINITY
s_cpu                 INFINITY
h_cpu                 INFINITY
s_fsize               INFINITY
h_fsize               INFINITY
s_data                INFINITY
h_data                INFINITY
s_stack               INFINITY
h_stack               INFINITY
s_core                INFINITY
h_core                INFINITY
s_rss                 INFINITY
h_rss                 INFINITY
s_vmem                INFINITY
h_vmem                INFINITY
EOL
sudo qconf -Aq ./grid
rm ./grid

# add the current host to the submit host list (will be able to do qsub)
sudo qconf -as master
sudo qconf -as worker1
sudo qconf -as worker2
sudo qconf -as worker3
sudo qconf -as worker4
sudo qconf -as worker5

# add to the admin host list so that we can do qstat, etc.
sudo qconf -ah master
sudo qconf -ah worker1
sudo qconf -ah worker2
sudo qconf -ah worker3
sudo qconf -ah worker4
sudo qconf -ah worker5

# add a worker to a queue.
sudo bash /vagrant/sge-worker-add.sh bioinfo.q worker1 10
sudo bash /vagrant/sge-worker-add.sh bioinfo.q worker2 10
sudo bash /vagrant/sge-worker-add.sh bioinfo.q worker3 10
sudo bash /vagrant/sge-worker-add.sh bioinfo.q worker4 10
sudo bash /vagrant/sge-worker-add.sh bioinfo.q worker5 10

# remove a worker from a queue.
# sudo bash /vagrant/sge-worker-remove.sh bioinfo.q worker1
# sudo bash /vagrant/sge-worker-remove.sh bioinfo.q worker2
# sudo bash /vagrant/sge-worker-remove.sh bioinfo.q worker3
# sudo bash /vagrant/sge-worker-remove.sh bioinfo.q worker4
# sudo bash /vagrant/sge-worker-remove.sh bioinfo.q worker5

