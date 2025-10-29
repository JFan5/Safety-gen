; params: satgen 713016 2 2 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph1 - mode
	infrared3 - mode
	thermograph2 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star4 - direction
	Star1 - direction
	Star3 - direction
	GroundStation2 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared3)
	(calibration_target instrument2 Star3)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Phenomenon10)
	(have_image Phenomenon5 spectrograph1)
	(have_image Planet6 thermograph0)
	(have_image Phenomenon7 infrared3)
	(have_image Star8 thermograph0)
	(have_image Phenomenon9 thermograph2)
	(have_image Phenomenon10 thermograph0)
))

)
