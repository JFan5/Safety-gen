(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_04 obj_05 obj_02 obj_01 obj_03 )
(:init
(pred_2)
(pred_3 obj_04)
(pred_5 obj_05 obj_01)
(pred_3 obj_02)
(pred_5 obj_01 obj_03)
(pred_5 obj_03 obj_02)
(pred_4 obj_04)
(pred_4 obj_05)
)
(:goal
(and
(pred_5 obj_04 obj_05)
(pred_5 obj_05 obj_03)
(pred_5 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_5 obj_05 obj_03) (pred_5 obj_04 obj_05))
)
)