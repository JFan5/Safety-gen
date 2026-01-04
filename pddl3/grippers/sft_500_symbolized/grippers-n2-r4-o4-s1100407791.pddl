(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_1
obj_01 obj_05 obj_06 obj_03 - type_3
obj_12 obj_02 obj_10 obj_09 - type_2
obj_04 obj_11 obj_13 obj_14 - object)
(:init
(pred_3 obj_07 obj_10)
(pred_1 obj_07 obj_01)
(pred_1 obj_07 obj_05)
(pred_3 obj_08 obj_12)
(pred_1 obj_08 obj_06)
(pred_1 obj_08 obj_03)
(pred_4 obj_04 obj_12)
(pred_4 obj_11 obj_10)
(pred_4 obj_13 obj_09)
(pred_4 obj_14 obj_12)
)
(:goal
(and
(pred_4 obj_04 obj_02)
(pred_4 obj_11 obj_02)
(pred_4 obj_13 obj_02)
(pred_4 obj_14 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_09)))
)
)