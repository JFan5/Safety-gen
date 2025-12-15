(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_1
obj_12 obj_07 obj_01 obj_06 - type_3
obj_05 obj_04 obj_11 obj_08 - type_2
obj_03 obj_10 obj_14 obj_02 - object)
(:init
(pred_3 obj_09 obj_11)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_07)
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_01)
(pred_4 obj_13 obj_06)
(pred_2 obj_03 obj_05)
(pred_2 obj_10 obj_11)
(pred_2 obj_14 obj_08)
(pred_2 obj_02 obj_05)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_10 obj_04)
(pred_2 obj_14 obj_08)
(pred_2 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_04)))
)
)