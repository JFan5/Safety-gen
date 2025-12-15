(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_1
obj_10 obj_06 obj_09 obj_04 - type_3
obj_01 obj_08 obj_02 - type_2
obj_12 obj_03 obj_07 - object)
(:init
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_06)
(pred_3 obj_11 obj_08)
(pred_4 obj_11 obj_09)
(pred_4 obj_11 obj_04)
(pred_2 obj_12 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_07 obj_02)
)
(:goal
(and
(pred_2 obj_12 obj_01)
(pred_2 obj_03 obj_02)
(pred_2 obj_07 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_02)))
)
)