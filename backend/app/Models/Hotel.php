<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    public function rooms()
    {
        return $this->hasMany('App\Models\Room');
    }

    public function reviews()
    {
        return $this->hasMany('App\Models\Review');
    }
}
