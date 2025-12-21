(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_06 obj_13 obj_04 obj_05 - type_2
obj_08 obj_09 obj_11 obj_12 - type_3
obj_07 obj_03 obj_01 - object)
(:init
(pred_1 obj_02 obj_12)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_13)
(pred_1 obj_10 obj_11)
(pred_3 obj_10 obj_04)
(pred_3 obj_10 obj_05)
(pred_2 obj_07 obj_09)
(pred_2 obj_03 obj_11)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_07 obj_11)
(pred_2 obj_03 obj_12)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_11)))
)
)