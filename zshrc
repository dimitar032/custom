#datagrip
alias data_grip_remove_old_sql_files="sudo rm -rf /home/mitaka/.DataGrip2017.2/config/projects/default/.idea/dataSources/*"

#php
alias p="vendor/bin/phpunit"

#artisan
alias art="php artisan"
alias tinker="php artisan tinker"
alias serve="php artisan serve"

#laravel
alias lara_log="tail -f -n 150 storage/logs/laravel.log"
alias lara_worker_log="tail -f -n 150 storage/logs/worker.log"
alias lara_worker_restart="sudo supervisorctl restart laravel-worker:*"
alias lara_worker_start="php artisan queue:work --tries=3"
