(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_1
obj_11 obj_12 obj_06 obj_05 - type_3
obj_09 obj_03 obj_13 obj_10 - type_2
obj_07 obj_04 obj_01 - object)
(:init
(pred_1 obj_08 obj_09)
(pred_2 obj_08 obj_11)
(pred_2 obj_08 obj_12)
(pred_1 obj_02 obj_03)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_05)
(pred_4 obj_07 obj_13)
(pred_4 obj_04 obj_03)
(pred_4 obj_01 obj_13)
)
(:goal
(and
(pred_4 obj_07 obj_10)
(pred_4 obj_04 obj_09)
(pred_4 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_13)))
)
)