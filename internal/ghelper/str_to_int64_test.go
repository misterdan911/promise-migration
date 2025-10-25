package ghelper

import "testing"

func TestStringToInt64WithDefault(t *testing.T) {
	got := StringToInt64WithDefault("18000.00", 0)
	want := int64(18000)

	if got != want {
		t.Errorf("got %d, wanted %d", got, want)
	}
}
