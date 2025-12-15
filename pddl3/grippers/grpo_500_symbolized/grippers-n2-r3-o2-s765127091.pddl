(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_02 obj_10 obj_07 obj_05 - type_3
obj_04 obj_03 obj_06 - type_2
obj_08 obj_01 - object)
(:init
(pred_3 obj_11 obj_03)
(pred_4 obj_11 obj_02)
(pred_4 obj_11 obj_10)
(pred_3 obj_09 obj_06)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_05)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_06)))
)
)