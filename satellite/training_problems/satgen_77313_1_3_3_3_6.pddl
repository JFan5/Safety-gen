; params: satgen 77313 1 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	infrared1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star0 - direction
	GroundStation2 - direction
	Planet3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Planet3 infrared1)
	(have_image Planet4 spectrograph2)
	(have_image Star5 thermograph0)
	(have_image Planet6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Phenomenon8 thermograph0)
))

)
