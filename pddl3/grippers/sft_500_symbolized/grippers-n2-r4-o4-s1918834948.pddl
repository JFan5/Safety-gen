(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_01 obj_10 obj_03 obj_13 - type_2
obj_08 obj_05 obj_02 obj_09 - type_3
obj_14 obj_12 obj_07 obj_04 - object)
(:init
(pred_2 obj_11 obj_02)
(pred_1 obj_11 obj_01)
(pred_1 obj_11 obj_10)
(pred_2 obj_06 obj_05)
(pred_1 obj_06 obj_03)
(pred_1 obj_06 obj_13)
(pred_3 obj_14 obj_08)
(pred_3 obj_12 obj_02)
(pred_3 obj_07 obj_05)
(pred_3 obj_04 obj_02)
)
(:goal
(and
(pred_3 obj_14 obj_08)
(pred_3 obj_12 obj_08)
(pred_3 obj_07 obj_05)
(pred_3 obj_04 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_08)))
)
)