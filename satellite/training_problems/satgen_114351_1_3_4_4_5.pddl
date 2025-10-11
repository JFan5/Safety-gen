; params: satgen 114351 1 3 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	infrared3 - mode
	spectrograph0 - mode
	infrared1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star1 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Planet4 infrared1)
	(have_image Star5 infrared2)
	(have_image Phenomenon6 infrared3)
	(have_image Phenomenon7 infrared3)
	(have_image Planet8 infrared1)
))

)
