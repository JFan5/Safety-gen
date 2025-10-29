; params: satgen 683888 2 2 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation1 - direction
	GroundStation6 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation6)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph2)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation6)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Star8)
	(pointing satellite1 Phenomenon9)
	(have_image Star8 spectrograph0)
	(have_image Phenomenon9 spectrograph1)
))

)
