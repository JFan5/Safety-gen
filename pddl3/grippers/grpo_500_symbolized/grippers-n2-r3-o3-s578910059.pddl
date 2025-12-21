(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_12 obj_04 obj_05 obj_03 - type_3
obj_09 obj_11 obj_06 - type_2
obj_08 obj_01 obj_07 - object)
(:init
(pred_4 obj_02 obj_06)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_04)
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_05)
(pred_2 obj_10 obj_03)
(pred_3 obj_08 obj_09)
(pred_3 obj_01 obj_09)
(pred_3 obj_07 obj_11)
)
(:goal
(and
(pred_3 obj_08 obj_06)
(pred_3 obj_01 obj_09)
(pred_3 obj_07 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_11)))
)
)