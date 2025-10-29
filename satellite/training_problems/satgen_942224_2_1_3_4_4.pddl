; params: satgen 942224 2 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	image1 - mode
	spectrograph2 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Star6)
	(pointing satellite1 GroundStation0)
	(have_image Phenomenon4 spectrograph2)
	(have_image Phenomenon5 spectrograph2)
	(have_image Star6 thermograph0)
	(have_image Phenomenon7 spectrograph2)
))

)
