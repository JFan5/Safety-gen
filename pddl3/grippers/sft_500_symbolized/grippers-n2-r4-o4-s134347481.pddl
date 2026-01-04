(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_14 - type_1
obj_07 obj_09 obj_10 obj_08 - type_2
obj_11 obj_03 obj_02 obj_01 - type_3
obj_06 obj_04 obj_05 obj_13 - object)
(:init
(pred_1 obj_12 obj_01)
(pred_2 obj_12 obj_07)
(pred_2 obj_12 obj_09)
(pred_1 obj_14 obj_02)
(pred_2 obj_14 obj_10)
(pred_2 obj_14 obj_08)
(pred_4 obj_06 obj_02)
(pred_4 obj_04 obj_02)
(pred_4 obj_05 obj_01)
(pred_4 obj_13 obj_03)
)
(:goal
(and
(pred_4 obj_06 obj_01)
(pred_4 obj_04 obj_01)
(pred_4 obj_05 obj_03)
(pred_4 obj_13 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_02)))
)
)