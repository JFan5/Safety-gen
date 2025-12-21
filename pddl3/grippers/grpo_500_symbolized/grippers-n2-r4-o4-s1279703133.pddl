(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_01 obj_14 obj_05 obj_02 - type_3
obj_03 obj_09 obj_08 obj_12 - type_2
obj_13 obj_06 obj_07 obj_11 - object)
(:init
(pred_4 obj_10 obj_08)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_14)
(pred_4 obj_04 obj_12)
(pred_2 obj_04 obj_05)
(pred_2 obj_04 obj_02)
(pred_3 obj_13 obj_08)
(pred_3 obj_06 obj_09)
(pred_3 obj_07 obj_03)
(pred_3 obj_11 obj_12)
)
(:goal
(and
(pred_3 obj_13 obj_09)
(pred_3 obj_06 obj_12)
(pred_3 obj_07 obj_08)
(pred_3 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_09)))
)
)