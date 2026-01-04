(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_1
obj_10 obj_02 obj_03 obj_13 - type_3
obj_06 obj_05 obj_11 obj_09 - type_2
obj_07 obj_08 obj_04 - object)
(:init
(pred_4 obj_12 obj_05)
(pred_1 obj_12 obj_10)
(pred_1 obj_12 obj_02)
(pred_4 obj_01 obj_11)
(pred_1 obj_01 obj_03)
(pred_1 obj_01 obj_13)
(pred_3 obj_07 obj_09)
(pred_3 obj_08 obj_06)
(pred_3 obj_04 obj_09)
)
(:goal
(and
(pred_3 obj_07 obj_06)
(pred_3 obj_08 obj_11)
(pred_3 obj_04 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_11)))
)
)