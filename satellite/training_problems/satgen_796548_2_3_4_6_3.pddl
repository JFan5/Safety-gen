; params: satgen 796548 2 3 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	thermograph3 - mode
	infrared2 - mode
	GroundStation4 - direction
	Star5 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 Star5)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation2)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument3 thermograph3)
	(supports instrument3 infrared2)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 GroundStation1)
	(supports instrument4 spectrograph1)
	(supports instrument4 infrared2)
	(calibration_target instrument4 GroundStation2)
	(calibration_target instrument4 GroundStation1)
	(supports instrument5 spectrograph0)
	(calibration_target instrument5 Star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite1 GroundStation2)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 spectrograph1)
	(have_image Planet8 thermograph3)
))

)
