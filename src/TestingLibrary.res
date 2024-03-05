type element = Dom.element

module Render = {
	type t
	external void: (t) => unit = "%identity"

	// https://testing-library.com/docs/queries/about
	// getBy...	0: Throw error, 1: 	Return element	>1: Throw error	async: No
	@send external getByRole: (t, string) => option<element> = "getByRole"
	@send external getByLabelText: (t, string) => option<element> = "getByLabelText"
	@send external getByPlaceholderText: (t, string) => option<element> = "getByPlaceholderText"
	@send external getByText: (t, string) => option<element> = "getByText"
	@send external getByDisplayValue: (t, string) => option<element> = "getByDisplayValue"
	@send external getByAltText: (t, string) => option<element> = "getByAltText"
	@send external getByTitle: (t, string) => option<element> = "getByTitle"
	@send external getByTestId: (t, string) => option<element> = "getByTestId"

	// queryBy...	0: Return null	1: Return element	>1: Throw error	async: No

	@send external queryByRole: (t, string) => Null.t<element> = "queryByRole"
	@send external queryByLabelText: (t, string) => Null.t<element> = "queryByLabelText"
	@send external queryByPlaceholderText: (t, string) => Null.t<element> = "queryByPlaceholderText"
	@send external queryByText: (t, string) => Null.t<element> = "queryByText"
	@send external queryByDisplayValue: (t, string) => Null.t<element> = "queryByDisplayValue"
	@send external queryByAltText: (t, string) => Null.t<element> = "queryByAltText"
	@send external queryByTitle: (t, string) => Null.t<element> = "queryByTitle"
	@send external queryByTestId: (t, string) => Null.t<element> = "queryByTestId"

	// findBy...	0: Throw error	1: Return element	>1: Throw error	async: Yes
	@send external findByRole: (t, string) => Promise.t<element> = "findByRole"
	@send external findByLabelText: (t, string) => Promise.t<element> = "findByLabelText"
	@send external findByPlaceholderText: (t, string) => Promise.t<element> = "findByPlaceholderText"
	@send external findByText: (t, string) => Promise.t<element> = "findByText"
	@send external findByDisplayValue: (t, string) => Promise.t<element> = "findByDisplayValue"
	@send external findByAltText: (t, string) => Promise.t<element> = "findByAltText"
	@send external findByTitle: (t, string) => Promise.t<element> = "findByTitle"
	@send external findByTestId: (t, string) => Promise.t<element> = "findByTestId"

	// getAllBy...	0: Throw error	1: Return array	>1: Return array	async: No
	@send external getAllBy: (t, string) => array<element> = "getAllBy"
	@send external getAllByRole: (t, string) => array<element> = "getAllByRole"
	@send external getAllByLabelText: (t, string) => array<element> = "getAllByLabelText"
	@send external getAllByPlaceholderText: (t, string) => array<element> = "getAllByPlaceholderText"
	@send external getAllByText: (t, string) => array<element> = "getAllByText"
	@send external getAllByDisplayValue: (t, string) => array<element> = "getAllByDisplayValue"
	@send external getAllByAltText: (t, string) => array<element> = "getAllByAltText"
	@send external getAllByTitle: (t, string) => array<element> = "getAllByTitle"
	@send external getAllByTestId: (t, string) => array<element> = "getAllByTestId"

	// queryAllBy...	0: Return []	1: Return array	>1: Return array	async: No
	@send external queryAllByRole: (t, string) => array<element> = "queryAllByRole"
	@send external queryAllByLabelText: (t, string) => array<element> = "queryAllByLabelText"
	@send external queryAllByPlaceholderText: (t, string) => array<element> = "queryAllByPlaceholderText"
	@send external queryAllByText: (t, string) => array<element> = "queryAllByText"
	@send external queryAllByDisplayValue: (t, string) => array<element> = "queryAllByDisplayValue"
	@send external queryAllByAltText: (t, string) => array<element> = "queryAllByAltText"
	@send external queryAllByTitle: (t, string) => array<element> = "queryAllByTitle"
	@send external queryAllByTestId: (t, string) => array<element> = "queryAllByTestId"

	// findAllBy...	0: Throw error	1: Return array	>1: Return array	async: Yes
	@send external findAllByRole: (t, string) => Promise.t<array<element>> = "findAllByRole"
	@send external findAllByLabelText: (t, string) => Promise.t<array<element>> = "findAllByLabelText"
	@send external findAllByPlaceholderText: (t, string) => Promise.t<array<element>> = "findAllByPlaceholderText"
	@send external findAllByText: (t, string) => Promise.t<array<element>> = "findAllByText"
	@send external findAllByDisplayValue: (t, string) => Promise.t<array<element>> = "findAllByDisplayValue"
	@send external findAllByAltText: (t, string) => Promise.t<array<element>> = "findAllByAltText"
	@send external findAllByTitle: (t, string) => Promise.t<array<element>> = "findAllByTitle"
	@send external findAllByTestId: (t, string) => Promise.t<array<element>> = "findAllByTestId"

	@send external within: (element) => t = "within"

	@send external asFragment: t => element = "asFragment"

	@send external debug: t => unit = "debug"

}

@module("@testing-library/react") external render: React.element => Render.t = "render"

type screen
@module("@testing-library/react") external screen: screen = "screen"

// https://testing-library.com/docs/react-testing-library/api/#renderhook
// https://react-hooks-testing-library.com/reference/api
type renderHookOptions<'props> = {
	initialProps: 'props,
}

type error
// TODO: Were using react-testing-library-not react-hooks-testing-library, so different return - AxM
// TODO: adding mutable keyword to field causes tests to fail. - AxM
type result<'res> = {
  all: array<'res>,
  current: 'res,
  error: error
}

type renderHookResult<'props, 'result, 'v> = {
	result: result<'result>,
	rerender: 'props => unit,
	waitForNextUpdate: () => Promise.t<unit>,
	waitFor: (() => bool) => Promise.t<unit>,
	waitForValueToChange: (() => 'v) => Promise.t<unit>,
}

@module("@testing-library/react-hooks") external act: (unit => unit) => unit = "act"
@module("@testing-library/react-hooks") external actPromise: (unit => Promise.t<unit>) => Promise.t<unit> = "act"
@module("@testing-library/react-hooks") external renderHook: ('props => 'result) => renderHookResult<'props, 'result, 'v> = "renderHook"
@module("@testing-library/react-hooks") external renderHookOpt: ('props => 'result, renderHookOptions<'props>) => renderHookResult<'props, 'result, 'v> = "renderHook"
@module("@testing-library/react-hooks") external cleanup: unit => Promise.t<unit> = "cleanup"

// https://testing-library.com/docs/user-event/intro
module UserEvent = {
	type t
	@module("@testing-library/user-event") external userEvent: t = "userEvent"

	type user
	@send external setup: t => user = "setup"

	let setup = () => setup(userEvent)

	@send external keyboard: (user, string) => Promise.t<()> = "keyboard"
	@send external click: (user, element) => Promise.t<()> = "click"

	type pointerTarget = {
		target: element,
	}

	type pointerInput = {
		keys?: string,
		target?: pointerTarget,
		pointerName?: string,
		offset?: int,
	}

	@send external pointer: (user, array<pointerInput>) => Promise.t<()> = "pointer"
	@send external clear: (user, element)  => () = "clear"

	type dataTransfer
	@send external copy: (user) => Promise.t<dataTransfer> = "copy"

	@send external cut: (user) => Promise.t<dataTransfer> = "cut"
	@send external paste: (user, dataTransfer) => Promise.t<()> = "paste"
	@send external pasteString: (user, string) => Promise.t<()> = "paste"

	@send external selectOptions: (user, element, array<string>) => Promise.t<()> = "selectOptions"
	@send external deselectOptions: (user, element, array<string>) => Promise.t<()> = "deselectOptions"
	@send external type_: (user, element, string) => Promise.t<()> = "type"

	@send external upload: (user, element, array<Webapi.File.t>) => Promise.t<()> = "upload"

	@send external hover: (user, element) => Promise.t<()> = "hover"
	@send external unhover: (user, element) => Promise.t<()> = "unhover"
}

