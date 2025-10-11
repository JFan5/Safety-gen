; params: satgen 340377 2 2 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph1 - mode
	thermograph3 - mode
	spectrograph0 - mode
	thermograph2 - mode
	Star2 - direction
	Star5 - direction
	GroundStation3 - direction
	Star0 - direction
	Star1 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation4)
	(calibration_target instrument2 GroundStation6)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet10)
)
(:goal (and
	(pointing satellite0 Star0)
	(pointing satellite1 Star5)
	(have_image Planet7 thermograph1)
	(have_image Star8 thermograph2)
	(have_image Planet9 thermograph1)
	(have_image Planet10 thermograph2)
	(have_image Planet11 thermograph1)
))

)
