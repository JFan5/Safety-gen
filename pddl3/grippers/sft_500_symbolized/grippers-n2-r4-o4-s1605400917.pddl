(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_13 - type_2
obj_08 obj_03 obj_01 obj_14 - type_1
obj_05 obj_04 obj_09 obj_12 - type_3
obj_07 obj_11 obj_06 obj_10 - object)
(:init
(pred_1 obj_02 obj_05)
(pred_4 obj_02 obj_08)
(pred_4 obj_02 obj_03)
(pred_1 obj_13 obj_12)
(pred_4 obj_13 obj_01)
(pred_4 obj_13 obj_14)
(pred_2 obj_07 obj_05)
(pred_2 obj_11 obj_09)
(pred_2 obj_06 obj_04)
(pred_2 obj_10 obj_12)
)
(:goal
(and
(pred_2 obj_07 obj_05)
(pred_2 obj_11 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_10 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_09)))
)
)