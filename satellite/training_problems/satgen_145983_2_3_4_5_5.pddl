; params: satgen 145983 2 3 4 5 5
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
	spectrograph1 - mode
	thermograph2 - mode
	image3 - mode
	image0 - mode
	GroundStation4 - direction
	Star3 - direction
	Star2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(supports instrument3 image0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 image3)
	(supports instrument4 image0)
	(supports instrument4 thermograph2)
	(calibration_target instrument4 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Star5 image3)
	(have_image Star6 thermograph2)
	(have_image Planet7 image0)
	(have_image Star8 spectrograph1)
	(have_image Phenomenon9 image3)
))

)
