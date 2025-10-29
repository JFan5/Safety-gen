; params: satgen 342676 2 2 3 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared2 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation4)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(have_image Phenomenon7 spectrograph0)
	(have_image Planet8 infrared2)
	(have_image Phenomenon9 spectrograph0)
	(have_image Planet10 infrared2)
	(have_image Star11 infrared2)
	(have_image Phenomenon12 infrared2)
))

)
