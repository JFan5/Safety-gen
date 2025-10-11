; params: satgen 450441 2 3 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	thermograph0 - mode
	image3 - mode
	infrared2 - mode
	spectrograph1 - mode
	GroundStation2 - direction
	Star1 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 image3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star1)
	(supports instrument3 image3)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 spectrograph1)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(have_image Star4 infrared2)
	(have_image Star5 spectrograph1)
	(have_image Planet6 infrared2)
	(have_image Phenomenon7 thermograph0)
))

)
