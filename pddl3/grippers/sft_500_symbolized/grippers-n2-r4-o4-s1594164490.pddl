(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_3
obj_07 obj_05 obj_02 obj_10 - type_2
obj_01 obj_03 obj_11 obj_09 - type_1
obj_04 obj_14 obj_08 obj_06 - object)
(:init
(pred_4 obj_13 obj_11)
(pred_2 obj_13 obj_07)
(pred_2 obj_13 obj_05)
(pred_4 obj_12 obj_01)
(pred_2 obj_12 obj_02)
(pred_2 obj_12 obj_10)
(pred_1 obj_04 obj_03)
(pred_1 obj_14 obj_03)
(pred_1 obj_08 obj_01)
(pred_1 obj_06 obj_03)
)
(:goal
(and
(pred_1 obj_04 obj_09)
(pred_1 obj_14 obj_09)
(pred_1 obj_08 obj_11)
(pred_1 obj_06 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_09)))
)
)