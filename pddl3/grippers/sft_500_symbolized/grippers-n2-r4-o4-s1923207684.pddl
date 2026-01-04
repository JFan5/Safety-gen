(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_2
obj_01 obj_03 obj_13 obj_05 - type_3
obj_06 obj_07 obj_10 obj_08 - type_1
obj_09 obj_12 obj_14 obj_11 - object)
(:init
(pred_1 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_03)
(pred_1 obj_04 obj_06)
(pred_4 obj_04 obj_13)
(pred_4 obj_04 obj_05)
(pred_2 obj_09 obj_06)
(pred_2 obj_12 obj_10)
(pred_2 obj_14 obj_08)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_12 obj_07)
(pred_2 obj_14 obj_10)
(pred_2 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_07)))
)
)