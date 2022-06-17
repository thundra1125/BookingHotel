<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

     public function hotel()
    {
        return $this->belongsTo('App\Models\Hotel');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
}
