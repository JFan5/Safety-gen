(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_12 - type_1
obj_11 obj_05 obj_03 obj_01 - type_3
obj_06 obj_04 obj_07 obj_02 - type_2
obj_10 obj_13 obj_09 - object)
(:init
(pred_3 obj_08 obj_06)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_05)
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_03)
(pred_4 obj_12 obj_01)
(pred_2 obj_10 obj_06)
(pred_2 obj_13 obj_07)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_10 obj_07)
(pred_2 obj_13 obj_02)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_07)))
)
)