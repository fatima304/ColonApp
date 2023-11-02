<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;


class Appointments extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'doc_id',
        'date',
        'day',
        'time',
        'status',
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function cancel(Request $request)
{
  // Validate the appointment ID
  $request->validate([
    'appointment_id' => 'required|exists:appointments,id',
  ]);

  // Get the appointment to cancel
  $appointment = Appointments::findOrFail($request->appointment_id);

  // Cancel the appointment
  $appointment->status = 'cancelled';
  $appointment->save();

  return response()->json(['success' => true]);
}
}
