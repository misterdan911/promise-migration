package sidapethelper

import (
	"testing"
)

func TestParseNilaiPengalaman(t *testing.T) {
	var kursRp int64
	kursRp = 10000

	tests := []struct {
		name          string
		input         string
		expectedValue int64
		expectedError bool
	}{
		{
			name:          "number with dot separator",
			input:         "234.140.113",
			expectedValue: 234140113,
			expectedError: false,
		},
		{
			name:          "number with dot separator & suffix ,-",
			input:         "1.208.860.000,-",
			expectedValue: 1208860000,
			expectedError: false,
		},
		{
			name:          "number with comma separator & decimal .",
			input:         "111,375,000.00",
			expectedValue: 111375000,
			expectedError: false,
		},
		{
			name:          "number with prefix Rp. , dot separator & suffix ,-",
			input:         "Rp. 585.351.700,-",
			expectedValue: 585351700,
			expectedError: false,
		},
		{
			name:          "number with prefix Rp.  , dot separator & suffix ,-",
			input:         "Rp.   2.241.797.934,-",
			expectedValue: 2241797934,
			expectedError: false,
		},
		{
			name:          "number with prefix Rp , dot separator & suffix ,-",
			input:         "Rp 592.660.000,-",
			expectedValue: 592660000,
			expectedError: false,
		},
		{
			name:          "number with prefix Rp. , dot separator & decimal",
			input:         "Rp 2.569.256.636,00",
			expectedValue: 2569256636,
			expectedError: false,
		},
		{
			name:          "number with prefix USD",
			input:         "USD 2000",
			expectedValue: 2000 * kursRp,
			expectedError: false,
		},
		{
			name:          "number with prefix USD",
			input:         "USD 65,239",
			expectedValue: 65239 * kursRp,
			expectedError: false,
		},
		{
			name:          "number with miliar",
			input:         "50Miliar",
			expectedValue: 50000000000,
			expectedError: false,
		},
		{
			name:          "preceeding with number",
			input:         "1700000/BULAN/MESIN",
			expectedValue: 1700000,
			expectedError: false,
		},
		{
			name:          "dash",
			input:         "-",
			expectedValue: 0,
			expectedError: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			actualValue, err := ParseNilaiPengalaman(tt.input)

			if (err != nil) != tt.expectedError {
				t.Errorf("%s: expected error %v, got %v", tt.name, tt.expectedError, err)
				return
			}

			if actualValue != tt.expectedValue {
				t.Errorf("%s: expected value %d, got %d", tt.name, tt.expectedValue, actualValue)
			}
		})
	}
}
