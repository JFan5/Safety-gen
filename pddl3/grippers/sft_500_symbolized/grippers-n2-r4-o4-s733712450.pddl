(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_1
obj_09 obj_12 obj_07 obj_05 - type_2
obj_08 obj_01 obj_02 obj_04 - type_3
obj_14 obj_10 obj_11 obj_13 - object)
(:init
(pred_4 obj_06 obj_08)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_12)
(pred_4 obj_03 obj_08)
(pred_1 obj_03 obj_07)
(pred_1 obj_03 obj_05)
(pred_3 obj_14 obj_04)
(pred_3 obj_10 obj_08)
(pred_3 obj_11 obj_04)
(pred_3 obj_13 obj_01)
)
(:goal
(and
(pred_3 obj_14 obj_02)
(pred_3 obj_10 obj_04)
(pred_3 obj_11 obj_01)
(pred_3 obj_13 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_02)))
)
)