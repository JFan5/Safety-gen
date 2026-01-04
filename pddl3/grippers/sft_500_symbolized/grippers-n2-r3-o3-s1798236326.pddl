(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_1
obj_11 obj_04 obj_05 obj_12 - type_3
obj_06 obj_08 obj_09 - type_2
obj_07 obj_10 obj_01 - object)
(:init
(pred_1 obj_03 obj_06)
(pred_2 obj_03 obj_11)
(pred_2 obj_03 obj_04)
(pred_1 obj_02 obj_06)
(pred_2 obj_02 obj_05)
(pred_2 obj_02 obj_12)
(pred_3 obj_07 obj_08)
(pred_3 obj_10 obj_09)
(pred_3 obj_01 obj_06)
)
(:goal
(and
(pred_3 obj_07 obj_06)
(pred_3 obj_10 obj_08)
(pred_3 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_09)))
)
)