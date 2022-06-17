<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\FeatureController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\RoomController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Protected Routes

Route::group(['middleware' => 'auth:api'], function () {
    //Hotel routes
    Route::post('hotels', [HotelController::class, 'store']);
    Route::put('hotels/{hotel}', [HotelController::class, 'update']);
    Route::delete('hotels/{hotel}', [HotelController::class, 'destroy']);
    Route::get('hotels/all', [HotelController::class, 'getAllHotels']);

    //Room routes
    Route::post('rooms', [RoomController::class, 'store']);
    Route::put('rooms/{room}', [RoomController::class, 'update']);
    Route::delete('rooms/{room}', [RoomController::class,'destroy']);
    Route::get('rooms', [RoomController::class, 'index']);

    //Booking routes

    Route::get('bookings', [BookingController::class,'index']);
    Route::post('bookings', [BookingController::class,'store']);
    Route::get('bookings/user/{user}', [BookingController::class,'getUserBookings']);

    //Review routes

    Route::get('reviews', [ReviewController::class, 'index']);
    Route::post('reviews', [ReviewController::class, 'store']);
    Route::put('reviews/{review}', [ReviewController::class, 'update']);
    Route::delete('reviews/{review}', [ReviewController::class, 'destroy']);
    Route::get('reviews/user/{user}', [ReviewController::class, 'getUserReviews']);

    //User routes

    Route::get('users/{user}', [UserController::class, 'show']);
    Route::put('users/{user}', [UserController::class, 'update']);
    Route::put('users/{user}/update-personal-info', [UserController::class, 'updatePersonalInfo']);
    Route::put('users/{user}/update-email', [UserController::class, 'updateEmail']);
    Route::put('users/{user}/update-password', [UserController::class, 'updatePassword']);
    Route::delete('users/{user}', [UserController::class, 'destroy']);
});


//Hotel routes
Route::get('hotels', [HotelController::class, 'index']);
Route::post('hotels/search', [HotelController::class, 'search']);
Route::get('hotels/search', [HotelController::class, 'getSearchData']);
Route::get('hotels/images', [HotelController::class, 'getHotelImages']);
Route::get('hotels/{hotel}', [HotelController::class, 'show']);

//Room routes
Route::get('rooms/{room}', [RoomController::class,'show']);


//User routes

Route::post('login', [UserController::class,'login']); //auth
Route::post('register', [UserController::class, 'register']); //auth


//Feature routes

Route::get('features', [FeatureController::class, 'index']);
Route::get('features/{feature}', [FeatureController::class, 'show']);
Route::post('features', [FeatureController::class, 'store']);
Route::put('features/{feature}', [FeatureController::class, 'update']);
Route::delete('features/{feature}', [FeatureController::class, 'destroy']);

//Review routes
//if no logged
Route::get('reviews/hotel/{hotel}/', [ReviewController::class, 'getHotelReviews']);
//if logged
Route::get('reviews/hotel/{hotel}/{user}', [ReviewController::class, 'getHotelReviews']
);
