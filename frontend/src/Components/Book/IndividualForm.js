import React from "react";
import ReactPhoneInput from "react-phone-input-2";
import "react-phone-input-2/lib/style.css";

const IndividualForm = ({
  booking,
  setBooking,
  maxLengthCheck,
  onSubmitHandler,
}) => {
  return (
    <>
      <h2 className="pl-5 text-2xl">Step 3: Individual Details</h2>
      <form className="p-5" onSubmit={onSubmitHandler}>
        <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between pt-2">
          <label htmlFor="email" className="mr-2">
            E-mail*
          </label>
          <div className="w-full lg:w-3/4">
            <input
              id="email"
              type="text"
              className="p-2 border border-gray-600 mt-2 md:w-2/3"
              aria-required="true"
              value={booking.email}
              onChange={(e) =>
                setBooking({
                  ...booking,
                  email: e.target.value,
                })
              }
            />
          </div>
        </div>
        <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between pt-2">
          <label htmlFor="cvv" className="mr-2">
            Phone*
          </label>
          <div className="w-full lg:w-3/4">
            <ReactPhoneInput
              inputExtraProps={{
                name: "phone",
                required: true,
                autoFocus: true,
              }}
              value={booking.phone}
              onChange={(value) =>
                setBooking({
                  ...booking,
                  phone: value,
                })
              }
            />
          </div>
        </div>

        <h2 className="pl-5 text-2xl">Step 3: Place Order</h2>

        <button
          type="submit"
          className="bg-orange-700 mt-5 py-2 px-6 text-3xl text-gray-200 block w-10/12 mx-auto hover:bg-orange-900"
        >
          BOOK
        </button>
      </form>
    </>
  );
};

export default IndividualForm;
