import {
  GET_USER_BOOKINGS,
  GET_ALL_BOOKINGS,
  GET_SELECTED_ROOM_BOOKINGS,
  ADD_BOOKING,
  SET_LOADING,
  SET_SUCCESS,
} from "../actionTypes";

const initialState = {
  allBookings: [],
  loading: false,
  booking: null,
  selected_rooms_bookings: [],
  success: null,
  errors: null,
  pagination: {
    current_page: null,
    first_page_url: null,
    from: null,
    last_page: null,
    last_page_url: null,
    next_page_url: null,
    path: null,
    per_page: null,
    prev_page_url: null,
  },
};

export default function (state = initialState, action) {
  switch (action.type) {
    case GET_USER_BOOKINGS: {
      return {
        ...state,
        allBookings: action.payload.bookings.data,
        pagination: {
          current_page: action.payload.bookings.current_page,
          first_page_url: action.payload.bookings.first_page_url,
          from: action.payload.bookings.from,
          last_page: action.payload.bookings.last_page,
          last_page_url: action.payload.bookings.last_page_url,
          next_page_url: action.payload.bookings.next_page_url,
          path: action.payload.bookings.path,
          per_page: action.payload.bookings.per_page,
          prev_page_url: action.payload.bookings.prev_page_url,
        },
      };
    }
    // case GET_ALL_BOOKINGS: {
    //   return {
    //     ...state,
    //     allBookings: action.payload.bookings.data,
    //     pagination: {
    //       current_page: action.payload.bookings.current_page,
    //       first_page_url: action.payload.bookings.first_page_url,
    //       from: action.payload.bookings.from,
    //       last_page: action.payload.bookings.last_page,
    //       last_page_url: action.payload.bookings.last_page_url,
    //       next_page_url: action.payload.bookings.next_page_url,
    //       path: action.payload.bookings.path,
    //       per_page: action.payload.bookings.per_page,
    //       prev_page_url: action.payload.bookings.prev_page_url,
    //     },
    //   };
    // }
    case GET_SELECTED_ROOM_BOOKINGS: {
      return {
        ...state,
        selected_rooms_bookings: action.payload,
      };
    }
    case ADD_BOOKING: {
      return {
        ...state,
        success: action.payload.success ? true : false,
        booking: action.payload.booking,
        errors: action.payload.success ? null : action.payload.errors,
        last_page: action.payload.bookings.last_page,
        last_page_url: action.payload.bookings.last_page_url,
        next_page_url: action.payload.bookings.next_page_url,
        path: action.payload.bookings.path,
        per_page: action.payload.bookings.per_page,
        prev_page_url: action.payload.bookings.prev_page_url,
      };
    }
    case SET_LOADING: {
      return {
        ...state,
        loading: action.payload,
      };
    }
    case SET_SUCCESS: {
      return {
        ...state,
        success: action.payload,
        last_page: action.payload.bookings.last_page,
        last_page_url: action.payload.bookings.last_page_url,
        next_page_url: action.payload.bookings.next_page_url,
        path: action.payload.bookings.path,
        per_page: action.payload.bookings.per_page,
        prev_page_url: action.payload.bookings.prev_page_url,
      };
    }
    default:
      return state;
  }
}
