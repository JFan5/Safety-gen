(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_2
obj_03 obj_06 obj_12 obj_11 - type_3
obj_02 obj_09 obj_04 - type_1
obj_05 obj_07 obj_01 - object)
(:init
(pred_3 obj_10 obj_04)
(pred_1 obj_10 obj_03)
(pred_1 obj_10 obj_06)
(pred_3 obj_08 obj_04)
(pred_1 obj_08 obj_12)
(pred_1 obj_08 obj_11)
(pred_2 obj_05 obj_04)
(pred_2 obj_07 obj_09)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_07 obj_02)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_09)))
)
)