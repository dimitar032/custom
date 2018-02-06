#datagrip
alias data_grip_remove_old_sql_files="sudo rm -rf /home/mitaka/.DataGrip2017.2/config/projects/default/.idea/dataSources/*"

#artisan
alias art="php artisan"
alias tinker="php artisan tinker"
alias serve="php artisan serve"
alias p="vendor/bin/phpunit"

#laravel
alias lara_log="tail -f storage/logs/laravel.log"
alias lara_worker_log="tail -f storage/logs/worker.log"
alias lara_worker_restart="sudo supervisorctl restart laravel-worker:*"
alias lara_worker_start="php artisan queue:work --tries=3"
