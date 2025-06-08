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
		/*
			// Special cases
			{
				name:          "empty string",
				input:         "",
				expectedValue: 0,
				expectedError: false,
			},
			{
				name:          "dash only",
				input:         "-",
				expectedValue: 0,
				expectedError: false,
			},
			{
				name:          "spaces only",
				input:         "    ",
				expectedValue: 0,
				expectedError: false,
			},

			// USD test cases
			{
				name:          "USD prefix with commas",
				input:         "USD 1,000",
				expectedValue: 1000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD prefix with dots",
				input:         "USD 1.000",
				expectedValue: 1000 * 10000,
				expectedError: false,
			},
			{
				name:          "lowercase usd prefix",
				input:         "usd 5000",
				expectedValue: 5000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with decimal and comma",
				input:         "USD 2,500.75",
				expectedValue: 2500 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with decimal and dot",
				input:         "USD 2.500,75",
				expectedValue: 2500 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with suffix ,**",
				input:         "USD 3000,**",
				expectedValue: 3000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with suffix .**",
				input:         "USD 3000.**",
				expectedValue: 3000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with suffix ,-",
				input:         "USD 4000,-",
				expectedValue: 4000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with suffix .-",
				input:         "USD 4000.-",
				expectedValue: 4000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with no spaces",
				input:         "USD5000",
				expectedValue: 5000 * 10000,
				expectedError: false,
			},
			{
				name:          "USD with multiple spaces",
				input:         "USD   6000",
				expectedValue: 6000 * 10000,
				expectedError: false,
			},

			// Rp test cases
			{
				name:          "Rp prefix with commas",
				input:         "Rp 1,000",
				expectedValue: 1000,
				expectedError: false,
			},
			{
				name:          "Rp prefix with dots",
				input:         "Rp 1.000",
				expectedValue: 1000,
				expectedError: false,
			},
			{
				name:          "lowercase rp prefix",
				input:         "rp 5000",
				expectedValue: 5000,
				expectedError: false,
			},
			{
				name:          "Rp. prefix with space",
				input:         "Rp. 2000",
				expectedValue: 2000,
				expectedError: false,
			},
			{
				name:          "Rp. prefix without space",
				input:         "Rp.3000",
				expectedValue: 3000,
				expectedError: false,
			},
			{
				name:          "Rp with suffix ,**",
				input:         "Rp 3000,**",
				expectedValue: 3000,
				expectedError: false,
			},
			{
				name:          "Rp with suffix .**",
				input:         "Rp 3000.**",
				expectedValue: 3000,
				expectedError: false,
			},
			{
				name:          "Rp with suffix ,-",
				input:         "Rp 4000,-",
				expectedValue: 4000,
				expectedError: false,
			},
			{
				name:          "Rp with suffix .-",
				input:         "Rp 4000.-",
				expectedValue: 4000,
				expectedError: false,
			},
			{
				name:          "Rp with ,00 suffix",
				input:         "Rp 5000,00",
				expectedValue: 5000,
				expectedError: false,
			},
			{
				name:          "Rp with .00 suffix",
				input:         "Rp 5000.00",
				expectedValue: 5000,
				expectedError: false,
			},

			// No prefix cases
			{
				name:          "plain number with commas",
				input:         "1,000",
				expectedValue: 1000,
				expectedError: false,
			},
			{
				name:          "plain number with dots",
				input:         "1.000",
				expectedValue: 1000,
				expectedError: false,
			},
			{
				name:          "plain number with suffix ,**",
				input:         "3000,**",
				expectedValue: 3000,
				expectedError: false,
			},
			{
				name:          "plain number with suffix .**",
				input:         "3000.**",
				expectedValue: 3000,
				expectedError: false,
			},
			{
				name:          "plain number with suffix ,-",
				input:         "4000,-",
				expectedValue: 4000,
				expectedError: false,
			},
			{
				name:          "plain number with suffix .-",
				input:         "4000.-",
				expectedValue: 4000,
				expectedError: false,
			},
			{
				name:          "plain number with spaces",
				input:         " 5000 ",
				expectedValue: 5000,
				expectedError: false,
			},
			{
				name:          "large number with mixed separators",
				input:         "1,000,000.000",
				expectedValue: 1000000000,
				expectedError: false,
			},
		*/
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
