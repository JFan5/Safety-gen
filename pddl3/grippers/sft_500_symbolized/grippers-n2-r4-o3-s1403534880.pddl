(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_10 - type_3
obj_07 obj_05 obj_03 obj_13 - type_1
obj_04 obj_02 obj_11 obj_09 - type_2
obj_08 obj_06 obj_12 - object)
(:init
(pred_3 obj_01 obj_09)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_05)
(pred_3 obj_10 obj_11)
(pred_4 obj_10 obj_03)
(pred_4 obj_10 obj_13)
(pred_1 obj_08 obj_02)
(pred_1 obj_06 obj_09)
(pred_1 obj_12 obj_02)
)
(:goal
(and
(pred_1 obj_08 obj_09)
(pred_1 obj_06 obj_09)
(pred_1 obj_12 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_11)))
)
)