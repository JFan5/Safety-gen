; params: satgen 416658 2 3 3 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation6 - direction
	Star0 - direction
	Star2 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation6)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon7 spectrograph2)
	(have_image Star8 thermograph0)
))

)
