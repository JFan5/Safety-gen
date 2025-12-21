(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_10 - type_1
obj_05 obj_11 obj_01 obj_04 - type_3
obj_03 obj_02 obj_06 - type_2
obj_08 obj_07 - object)
(:init
(pred_4 obj_09 obj_02)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_11)
(pred_4 obj_10 obj_02)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_04)
(pred_3 obj_08 obj_03)
(pred_3 obj_07 obj_06)
)
(:goal
(and
(pred_3 obj_08 obj_03)
(pred_3 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_06)))
)
)