(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_04 obj_03 obj_02 obj_05 obj_01 )
(:init
(pred_1)
(pred_5 obj_04 obj_01)
(pred_5 obj_03 obj_05)
(pred_3 obj_02)
(pred_3 obj_05)
(pred_5 obj_01 obj_03)
(pred_2 obj_04)
(pred_2 obj_02)
)
(:goal
(and
(pred_5 obj_04 obj_05)
(pred_3 obj_03)
(pred_5 obj_02 obj_01)
(pred_5 obj_05 obj_03)
(pred_3 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_03) (pred_5 obj_04 obj_05))
)
)