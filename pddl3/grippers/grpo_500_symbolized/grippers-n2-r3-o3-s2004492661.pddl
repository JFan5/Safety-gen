(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_02 obj_07 obj_05 obj_10 - type_3
obj_12 obj_06 obj_11 - type_2
obj_08 obj_01 obj_04 - object)
(:init
(pred_4 obj_09 obj_12)
(pred_2 obj_09 obj_02)
(pred_2 obj_09 obj_07)
(pred_4 obj_03 obj_12)
(pred_2 obj_03 obj_05)
(pred_2 obj_03 obj_10)
(pred_3 obj_08 obj_06)
(pred_3 obj_01 obj_12)
(pred_3 obj_04 obj_12)
)
(:goal
(and
(pred_3 obj_08 obj_11)
(pred_3 obj_01 obj_06)
(pred_3 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_11)))
)
)