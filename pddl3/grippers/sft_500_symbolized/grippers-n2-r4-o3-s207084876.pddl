(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_2
obj_11 obj_07 obj_09 obj_13 - type_3
obj_04 obj_01 obj_03 obj_05 - type_1
obj_02 obj_12 obj_08 - object)
(:init
(pred_4 obj_06 obj_03)
(pred_3 obj_06 obj_11)
(pred_3 obj_06 obj_07)
(pred_4 obj_10 obj_03)
(pred_3 obj_10 obj_09)
(pred_3 obj_10 obj_13)
(pred_2 obj_02 obj_04)
(pred_2 obj_12 obj_05)
(pred_2 obj_08 obj_04)
)
(:goal
(and
(pred_2 obj_02 obj_05)
(pred_2 obj_12 obj_04)
(pred_2 obj_08 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_05)))
)
)