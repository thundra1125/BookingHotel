import React, { useState, useEffect, useCallback } from "react";
import useSecureLs from "../Global/useSecureLs";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { useDispatch, useSelector } from "react-redux";
import { getSelectedRoomBookingDates } from "../../redux/actions/bookings";
import Dropdown from "react-dropdown";
import "react-dropdown/style.css";

function BookingDetails({ booking, setBooking }) {
  const [price, setPrice] = useState(0);
  const [room_id] = useSecureLs("room_id");
  const [room_name] = useSecureLs("room_name");
  const [room_price] = useSecureLs("room_price");
  const [room_image] = useSecureLs("room_image");
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());
  const room = {
    room_id,
    name: room_name,
    price: room_price,
    image: room_image,
  };
  const dispatch = useDispatch();
  const state = useSelector((state) => state);
  const options = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
  ];
  const defaultOption = options[0];

  const handleSelect = (e) => {
    setBooking({
      ...booking,
      guests: e.value,
    });
  };

  const calcPrice = () => {
    if (booking.check_in !== "" && booking.check_out !== "") {
      const oneDay = 24 * 60 * 60 * 1000;
      const check_out = new Date(booking.check_out);
      const check_in = new Date(booking.check_in);
      const diffDays = Math.floor((check_out - check_in) / oneDay);

      if (diffDays > 0) {
        setPrice(room.price * diffDays);
      }
    }
  };

  const dateRange = useCallback((sd, ed) => {
    var dateArray = new Array();
    var currentDate = sd;
    while (currentDate <= ed) {
      dateArray.push(new Date(currentDate));
      currentDate.setDate(currentDate.getDate() + 1);
    }
    return dateArray;
  }, []);

  useEffect(() => {
    getSelectedRoomBookingDates(dispatch, state.auth.token, room_id);

    calcPrice();
    setBooking({
      ...booking,
      amount: price,
    });
  }, [booking.check_in, booking.check_out, price]); // eslint-disable-line

  return (
    <>
      <h1 className="sr-only">Book Room</h1>
      <h2 className="pl-5 text-2xl">Step 1: Check Details</h2>

      <div className="p-5 overflow-visible">
        <div className="flex flex-col md:flex-row md:justify-between w-full bg-gray-200 rounded-sm  overflow-visible shadow-xl">
          <div className="md:w-1/4">
            <img // eslint-disable-line
              src={
                room_image
                  ? `${process.env.REACT_APP_BASE_URL}/img/rooms/${room_image}`
                  : "http://placehold.it/300x300?text=image not available"
              }
              alt="room image"
              className="h-full w-full object-cover"
            />
          </div>
          <div className="p-5 md:w-3/4">
            <div className="font-semibold text-2xl flex flex-col md:flex-row md:justify-between">
              <span>{room.name}</span>
              <span>
                <span>{price}</span>$
              </span>
            </div>
            <div className="mt-8">
              <div className="flex flex-col md:flex-row md:justify-between items-center">
                <label
                  htmlFor="check-in"
                  className="mr-5 text-gray-900 md:w-1/4"
                >
                  Check-in
                </label>
                <DatePicker
                  selected={startDate}
                  minDate={new Date()}
                  onChange={(date) => {
                    let nextDay = new Date(date);
                    nextDay.setDate(date.getDate() + 1);
                    setStartDate(date);
                    setBooking({
                      ...booking,
                      check_in: nextDay.toISOString().split("T")[0],
                      amount: price,
                    });
                  }}
                  value={startDate}
                  excludeDates={state.bookings.selected_rooms_bookings
                    .map((item) => {
                      return dateRange(
                        new Date(item.check_in),
                        new Date(item.check_out)
                      );
                    })
                    .flat()}
                />
              </div>
              <div className="flex flex-col md:flex-row md:justify-between items-center mt-4">
                <label
                  htmlFor="check-out"
                  className="mr-5 text-gray-900 md:w-1/4"
                >
                  Check-out
                </label>
                <DatePicker
                  selected={endDate}
                  minDate={new Date()}
                  onChange={(date) => {
                    let nextDay = new Date(date);
                    nextDay.setDate(date.getDate() + 1);
                    setEndDate(date);
                    setBooking({
                      ...booking,
                      check_out: nextDay.toISOString().split("T")[0],
                      amount: price,
                    });
                  }}
                  value={endDate}
                  excludeDates={state.bookings.selected_rooms_bookings
                    .map((item) => {
                      return dateRange(
                        new Date(item.check_in),
                        new Date(item.check_out)
                      );
                    })
                    .flat()}
                />
              </div>
              <div className="flex mt-4">
                <label htmlFor="check-out" className=" text-gray-900 md:w-1/4">
                  Guests number
                </label>
                <Dropdown
                  options={options}
                  onChange={handleSelect}
                  value={defaultOption}
                  placeholder="Select guest number"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default BookingDetails;
