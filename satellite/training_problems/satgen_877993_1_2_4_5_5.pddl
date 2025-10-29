; params: satgen 877993 1 2 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph3 - mode
	infrared1 - mode
	thermograph0 - mode
	infrared2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation3 - direction
	Star0 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Planet5 infrared1)
	(have_image Phenomenon6 infrared2)
	(have_image Star7 infrared1)
	(have_image Planet8 spectrograph3)
	(have_image Phenomenon9 infrared1)
))

)
