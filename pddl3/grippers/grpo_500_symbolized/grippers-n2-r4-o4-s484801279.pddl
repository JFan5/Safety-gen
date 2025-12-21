(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_14 - type_1
obj_11 obj_09 obj_03 obj_13 - type_3
obj_04 obj_07 obj_05 obj_12 - type_2
obj_08 obj_10 obj_01 obj_06 - object)
(:init
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_09)
(pred_4 obj_14 obj_07)
(pred_2 obj_14 obj_03)
(pred_2 obj_14 obj_13)
(pred_3 obj_08 obj_12)
(pred_3 obj_10 obj_12)
(pred_3 obj_01 obj_07)
(pred_3 obj_06 obj_12)
)
(:goal
(and
(pred_3 obj_08 obj_04)
(pred_3 obj_10 obj_07)
(pred_3 obj_01 obj_05)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_05)))
)
)