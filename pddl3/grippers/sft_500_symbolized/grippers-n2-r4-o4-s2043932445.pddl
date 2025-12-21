(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_08 obj_05 obj_09 obj_01 - type_2
obj_04 obj_13 obj_02 obj_14 - type_3
obj_07 obj_06 obj_12 obj_10 - object)
(:init
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_08)
(pred_3 obj_11 obj_05)
(pred_1 obj_03 obj_14)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_01)
(pred_2 obj_07 obj_14)
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_04)
(pred_2 obj_10 obj_14)
)
(:goal
(and
(pred_2 obj_07 obj_14)
(pred_2 obj_06 obj_02)
(pred_2 obj_12 obj_02)
(pred_2 obj_10 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_02)))
)
)