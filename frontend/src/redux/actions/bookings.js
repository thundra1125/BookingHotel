import {
  GET_USER_BOOKINGS,
  GET_ALL_BOOKINGS,
  ADD_BOOKING,
  GET_SELECTED_ROOM_BOOKINGS,
} from "../actionTypes";
import { setLoading } from "./global";

import axios from "axios";

const url = process.env.REACT_APP_BASE_URL;

//-----------------------------------------
export const getAllBookings = (dispatch, token, page = 1) => {
  setLoading(dispatch, true);
  axios(`${url}/api/bookings?page=${page}`, {
    headers: { Authorization: `Bearer ${token}` },
  })
    .then((response) => {
      dispatch({
        type: GET_ALL_BOOKINGS,
        payload: response.data.data,
      });
      setLoading(dispatch, false);
    })
    .catch((error) => {
      setLoading(dispatch, false);
      if (error.response.status === 401) {
        window.location.replace("/401");
      }
    });
};
//-----------------------------------------

export const getSelectedRoomBookingDates = (dispatch, token, room_id) => {
  setLoading(dispatch, true);
  axios(`${url}/api/bookings/getSelectedRoomBookingDates/${room_id}`, {
    headers: { Authorization: `Bearer ${token}` },
  })
    .then((response) => {
      dispatch({
        type: GET_SELECTED_ROOM_BOOKINGS,
        payload: response.data.data,
      });
      setLoading(dispatch, false);
    })
    .catch((error) => {
      setLoading(dispatch, false);
      if (error.response.status === 401) {
        window.location.replace("/401");
      }
    });
};

export const getUserBookings = (dispatch, id, token, page = 1) => {
  setLoading(dispatch, true);
  axios(`${url}/api/bookings/user/${id}?page=${page}`, {
    headers: { Authorization: `Bearer ${token}` },
  })
    .then((response) => {
      dispatch({
        type: GET_USER_BOOKINGS,
        payload: response.data.data,
      });
      setLoading(dispatch, false);
    })
    .catch((error) => {
      setLoading(dispatch, false);
      if (error.response.status === 401) {
        window.location.replace("/401");
      }
    });
};
//-----------------------------------------
export const addBooking = (dispatch, booking, token) => {
  setLoading(dispatch, true);
  axios
    .post(
      `${url}/api/bookings`,
      {
        full_name: booking.full_name[0] + " " + booking.full_name[1],
        number: booking.number,
        exp_month: booking.exp_month,
        exp_year: booking.exp_year,
        cvc: booking.cvc,
        check_in: booking.check_in,
        check_out: booking.check_out,
        user_id: booking.user_id,
        room_id: booking.room_id,
        amount: booking.amount,
        guests: booking.guests,
        email: booking.email,
        phone: booking.phone,
      },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    )
    .then((response) => {
      dispatch({
        type: ADD_BOOKING,
        payload: response.data.data,
      });
      setLoading(dispatch, false);
    })
    .catch((error) => {
      setLoading(dispatch, false);
      if (error.response.status === 401) {
        window.location.replace("/401");
      }
    });
};
