(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_14 obj_13 obj_11 obj_02 - type_3
obj_06 obj_12 obj_01 obj_07 - type_2
obj_08 obj_05 obj_04 obj_09 - object)
(:init
(pred_4 obj_03 obj_01)
(pred_2 obj_03 obj_14)
(pred_2 obj_03 obj_13)
(pred_4 obj_10 obj_12)
(pred_2 obj_10 obj_11)
(pred_2 obj_10 obj_02)
(pred_3 obj_08 obj_01)
(pred_3 obj_05 obj_07)
(pred_3 obj_04 obj_07)
(pred_3 obj_09 obj_06)
)
(:goal
(and
(pred_3 obj_08 obj_01)
(pred_3 obj_05 obj_06)
(pred_3 obj_04 obj_06)
(pred_3 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_07)))
)
)