<?php

namespace App\Console\Commands;

use App\Models\Cure;
use DateInterval;
use DateTime;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class everySecond extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'seconde:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will update db table';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // $userCure = auth()->user();
        // $dateNext = Cure::get('dateNextCure')->where('user_id', 6);
        // $dateNext = strtotime($dateNext);
        // // dd($dateNext);
        // $jourRestant = dateDiff(time(), $dateNext);
        // // print_r($jourRestant);
        // // dd(date('Y-m-d H:i:s', time()), $dateNext, $jourRestant['day']);
        // DB::table('cures')
        //     ->update(array(
        //         'jourRestant' =>  (string) $jourRestant['day'],
        //         'heurRestant' => (string) $jourRestant['hour'],
        //         'minuteRestant' => (string) $jourRestant['minute'],
        //         'secondeRestant' => (string) $jourRestant['second'],

        //     ));;

        // echo 'operation done ';
    }
}
