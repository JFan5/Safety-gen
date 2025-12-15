(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_2
obj_11 obj_07 obj_14 obj_12 - type_3
obj_03 obj_05 obj_09 obj_01 - type_1
obj_10 obj_02 obj_06 obj_13 - object)
(:init
(pred_1 obj_04 obj_01)
(pred_4 obj_04 obj_11)
(pred_4 obj_04 obj_07)
(pred_1 obj_08 obj_09)
(pred_4 obj_08 obj_14)
(pred_4 obj_08 obj_12)
(pred_2 obj_10 obj_03)
(pred_2 obj_02 obj_09)
(pred_2 obj_06 obj_09)
(pred_2 obj_13 obj_05)
)
(:goal
(and
(pred_2 obj_10 obj_09)
(pred_2 obj_02 obj_09)
(pred_2 obj_06 obj_03)
(pred_2 obj_13 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_09)))
)
)