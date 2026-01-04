(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_1
obj_05 obj_13 obj_12 obj_01 - type_2
obj_04 obj_08 obj_02 obj_14 - type_3
obj_10 obj_09 obj_07 obj_11 - object)
(:init
(pred_3 obj_06 obj_04)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_13)
(pred_3 obj_03 obj_08)
(pred_2 obj_03 obj_12)
(pred_2 obj_03 obj_01)
(pred_1 obj_10 obj_08)
(pred_1 obj_09 obj_02)
(pred_1 obj_07 obj_02)
(pred_1 obj_11 obj_14)
)
(:goal
(and
(pred_1 obj_10 obj_04)
(pred_1 obj_09 obj_08)
(pred_1 obj_07 obj_14)
(pred_1 obj_11 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_02)))
)
)