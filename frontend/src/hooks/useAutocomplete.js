import { useState } from "react";

const useAutocomplete = (options, setOptions, value, setValue) => {
  const handleCreate = label => {
    const newValue = { value: label, label };
    setOptions([...options, newValue]);
    setValue([...value, newValue]);
  };

  return {
    onChange: setValue,
    onCreateOption: handleCreate,
    options,
    value,
    isLoading: options == null
  };
};

export default useAutocomplete;
