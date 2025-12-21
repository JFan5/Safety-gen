(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_08 - type_1
obj_13 obj_06 obj_04 obj_03 - type_2
obj_09 obj_01 obj_05 obj_07 - type_3
obj_12 obj_02 obj_14 obj_10 - object)
(:init
(pred_1 obj_11 obj_05)
(pred_3 obj_11 obj_13)
(pred_3 obj_11 obj_06)
(pred_1 obj_08 obj_05)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_03)
(pred_2 obj_12 obj_09)
(pred_2 obj_02 obj_01)
(pred_2 obj_14 obj_05)
(pred_2 obj_10 obj_01)
)
(:goal
(and
(pred_2 obj_12 obj_09)
(pred_2 obj_02 obj_01)
(pred_2 obj_14 obj_07)
(pred_2 obj_10 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_07)))
)
)