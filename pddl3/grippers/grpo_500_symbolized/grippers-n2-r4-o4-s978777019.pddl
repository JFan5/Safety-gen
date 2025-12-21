(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_03 - type_1
obj_02 obj_07 obj_08 obj_05 - type_3
obj_10 obj_14 obj_11 obj_12 - type_2
obj_09 obj_06 obj_13 obj_01 - object)
(:init
(pred_4 obj_04 obj_10)
(pred_2 obj_04 obj_02)
(pred_2 obj_04 obj_07)
(pred_4 obj_03 obj_10)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_05)
(pred_3 obj_09 obj_14)
(pred_3 obj_06 obj_11)
(pred_3 obj_13 obj_12)
(pred_3 obj_01 obj_11)
)
(:goal
(and
(pred_3 obj_09 obj_11)
(pred_3 obj_06 obj_10)
(pred_3 obj_13 obj_10)
(pred_3 obj_01 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_11)))
)
)