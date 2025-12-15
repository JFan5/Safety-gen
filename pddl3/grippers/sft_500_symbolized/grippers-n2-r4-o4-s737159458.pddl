(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_3
obj_01 obj_11 obj_06 obj_05 - type_1
obj_02 obj_07 obj_04 obj_08 - type_2
obj_14 obj_09 obj_12 obj_13 - object)
(:init
(pred_3 obj_10 obj_08)
(pred_1 obj_10 obj_01)
(pred_1 obj_10 obj_11)
(pred_3 obj_03 obj_04)
(pred_1 obj_03 obj_06)
(pred_1 obj_03 obj_05)
(pred_4 obj_14 obj_07)
(pred_4 obj_09 obj_08)
(pred_4 obj_12 obj_07)
(pred_4 obj_13 obj_07)
)
(:goal
(and
(pred_4 obj_14 obj_02)
(pred_4 obj_09 obj_08)
(pred_4 obj_12 obj_04)
(pred_4 obj_13 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_04)))
)
)