(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_2
obj_14 obj_03 obj_13 obj_08 - type_1
obj_04 obj_10 obj_07 obj_09 - type_3
obj_02 obj_06 obj_01 obj_11 - object)
(:init
(pred_1 obj_05 obj_09)
(pred_4 obj_05 obj_14)
(pred_4 obj_05 obj_03)
(pred_1 obj_12 obj_04)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_08)
(pred_2 obj_02 obj_07)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_07)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_02 obj_07)
(pred_2 obj_06 obj_07)
(pred_2 obj_01 obj_04)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_07)))
)
)