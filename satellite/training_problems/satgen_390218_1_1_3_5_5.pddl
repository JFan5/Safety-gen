; params: satgen 390218 1 1 3 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Star8)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 spectrograph0)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph0)
))

)
