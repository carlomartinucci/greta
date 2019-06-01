import { emptyMenu } from "./menu.js";

export const MODAL_OPEN = "MODAL_OPEN";
export const MODAL_CLOSE = "MODAL_CLOSE";
export const MODAL_UPDATE = "MODAL_UPDATE";

const modalReducer = (state, action) => {
  if (action.type === MODAL_OPEN) {
    const { date, menu } = action.payload;
    return { isOpen: true, date, menu: menu || emptyMenu };
  } else if (action.type === MODAL_CLOSE) {
    return { isOpen: false, date: null, menu: emptyMenu };
  } else if (action.type === MODAL_UPDATE) {
    const { menuType, menu } = action.payload;
    return { ...state, menu: { ...state.menu, [menuType]: menu || emptyMenu } };
  } else {
    throw new Error(action.type);
  }
};

export const modalEmptyState = {
  isOpen: false,
  date: null,
  menu: emptyMenu
};

export default modalReducer;
