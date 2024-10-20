suite(function() {
	describe("Arithmancer Test Suite - Main Menu Tests", function() {
		it("There should be exactly one obj_settings_menu", function() {
			scr_slide_transition(TRANS_MODE.GOTO, rm_menu)
			expect(instance_number(obj_settings_menu)).toBe(1)
		})
	})
})