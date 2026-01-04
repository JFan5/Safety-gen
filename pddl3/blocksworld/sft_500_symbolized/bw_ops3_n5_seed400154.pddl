(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_02 obj_03 obj_04 obj_01 obj_05 )
(:init
(pred_3)
(pred_5 obj_02)
(pred_4 obj_03 obj_02)
(pred_5 obj_04)
(pred_4 obj_01 obj_05)
(pred_5 obj_05)
(pred_1 obj_03)
(pred_1 obj_04)
(pred_1 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_03)
(pred_5 obj_03)
(pred_5 obj_04)
(pred_5 obj_01)
(pred_5 obj_05))
)

(:constraints
  (sometime-before (pred_5 obj_03) (pred_4 obj_02 obj_03))
)
)