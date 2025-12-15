(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_2
obj_02 obj_01 obj_05 obj_10 - type_1
obj_12 obj_03 obj_07 - type_3
obj_09 obj_08 obj_11 - object)
(:init
(pred_3 obj_04 obj_12)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_01)
(pred_3 obj_06 obj_12)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_10)
(pred_2 obj_09 obj_12)
(pred_2 obj_08 obj_03)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_09 obj_12)
(pred_2 obj_08 obj_12)
(pred_2 obj_11 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_07)))
)
)