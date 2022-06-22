import { SEARCH, GET_SEARCH_DATA, SET_LOADING } from "../actionTypes";

const initialState = {
  hotels: [],
  cities: [],
  features: [],
  success: null,
  errors: null,
  loading: false,
  criteria: [],
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
    case SEARCH: {
      return {
        ...state,
        hotels: action.payload.hotels.data,
        success: action.payload.success ? true : false,
        errors: action.payload.success ? null : action.payload.errors,
        pagination: {
          current_page: action.payload.hotels.current_page,
          first_page_url: action.payload.hotels.first_page_url,
          from: action.payload.hotels.from,
          last_page: action.payload.hotels.last_page,
          last_page_url: action.payload.hotels.last_page_url,
          next_page_url: action.payload.hotels.next_page_url,
          path: action.payload.hotels.path,
          per_page: action.payload.hotels.per_page,
          prev_page_url: action.payload.hotels.prev_page_url,
        },
        criteria: {
          check_in: action.payload.criteria.check_in,
          check_out: action.payload.criteria.check_out,
          city: action.payload.criteria.city,
          min_price: action.payload.criteria.min_price,
          max_price: action.payload.criteria.max_price,
          fetrures: action.payload.criteria.features,
          star: action.payload.criteria.star,
        },
      };
    }
    case GET_SEARCH_DATA: {
      return {
        ...state,
        cities: action.payload.cities,
        features: action.payload.features,
      };
    }
    case SET_LOADING: {
      return {
        ...state,
        loading: action.payload,
      };
    }
    default:
      return state;
  }
}
