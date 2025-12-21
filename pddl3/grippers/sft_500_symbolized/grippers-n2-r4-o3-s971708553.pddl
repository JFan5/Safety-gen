(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_12 obj_09 obj_06 obj_07 - type_2
obj_03 obj_10 obj_05 obj_13 - type_3
obj_04 obj_01 obj_02 - object)
(:init
(pred_1 obj_08 obj_10)
(pred_3 obj_08 obj_12)
(pred_3 obj_08 obj_09)
(pred_1 obj_11 obj_10)
(pred_3 obj_11 obj_06)
(pred_3 obj_11 obj_07)
(pred_2 obj_04 obj_13)
(pred_2 obj_01 obj_03)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_04 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_05)))
)
)