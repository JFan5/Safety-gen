(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_1
obj_05 obj_10 obj_14 obj_07 - type_3
obj_13 obj_02 obj_01 obj_11 - type_2
obj_04 obj_08 obj_03 obj_09 - object)
(:init
(pred_4 obj_12 obj_02)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_10)
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_14)
(pred_2 obj_06 obj_07)
(pred_3 obj_04 obj_13)
(pred_3 obj_08 obj_01)
(pred_3 obj_03 obj_13)
(pred_3 obj_09 obj_13)
)
(:goal
(and
(pred_3 obj_04 obj_13)
(pred_3 obj_08 obj_13)
(pred_3 obj_03 obj_13)
(pred_3 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_01)))
)
)