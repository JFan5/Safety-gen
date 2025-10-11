; params: satgen 388493 1 3 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	infrared2 - mode
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star7 - direction
	Star6 - direction
	Star0 - direction
	GroundStation2 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star6)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star0)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star11)
)
(:goal (and
	(have_image Phenomenon8 infrared2)
	(have_image Planet9 spectrograph1)
	(have_image Planet10 thermograph0)
	(have_image Star11 thermograph0)
	(have_image Planet12 thermograph0)
	(have_image Star13 spectrograph1)
))

)
