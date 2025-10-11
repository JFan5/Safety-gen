; params: satgen 984995 2 1 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	image3 - mode
	infrared1 - mode
	infrared2 - mode
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star0 - direction
	Star6 - direction
	Star2 - direction
	Star1 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 infrared2)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon12)
)
(:goal (and
	(have_image Phenomenon7 spectrograph0)
	(have_image Phenomenon8 image3)
	(have_image Star9 infrared1)
	(have_image Planet10 spectrograph0)
	(have_image Phenomenon11 spectrograph0)
	(have_image Phenomenon12 infrared2)
))

)
