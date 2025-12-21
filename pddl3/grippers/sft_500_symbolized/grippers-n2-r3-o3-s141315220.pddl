(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_03 obj_12 obj_06 obj_08 - type_2
obj_07 obj_01 obj_02 - type_3
obj_04 obj_09 obj_05 - object)
(:init
(pred_1 obj_11 obj_07)
(pred_3 obj_11 obj_03)
(pred_3 obj_11 obj_12)
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_06)
(pred_3 obj_10 obj_08)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_07)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_02)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_02)))
)
)