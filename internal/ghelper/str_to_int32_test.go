package ghelper

import "testing"

func TestStringToInt32WithDefault(t *testing.T) {
	got := StringToInt32WithDefault("18000.00", 0)
	want := int32(18000)

	if got != want {
		t.Errorf("got %d, wanted %d", got, want)
	}
}
